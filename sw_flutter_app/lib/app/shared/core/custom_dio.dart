import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:sw_flutter_app/app/shared/util/constant.dart';

class CustomDio extends DioForNative {
  CustomDio([BaseOptions options]) : super(options) {
    options.baseUrl = ConstantApp.base_url;
    options.connectTimeout = 30000;
    options.receiveTimeout = 30000;
    options.responseType = ResponseType.json;
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    //options.method = 'Content-Type: application/json';
    //(transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  }

  dynamic requestInterceptor(RequestOptions options,
      {String token = ""}) async {
    if (token.isNotEmpty) {
      options.headers
          .addAll({HttpHeaders.authorizationHeader: "Bearer $token"});
    }

    return options;
  }

  dynamic responseInterceptor(Response options) async {
    //print("<-- ${options.statusCode} ${(options.request != null ? (options.request.baseUrl + options.request.path) : 'URL')}");
    //print("Headers:");
    //options.headers?.forEach((k, v) => print('$k: $v'));
    //print("Response: ${options.data}");
    //print("<-- END HTTP");
    var response = options;

    return Response(
      data: response?.data,
      headers: response?.headers,
      request: response?.request,
      isRedirect: response?.isRedirect,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
      redirects: response?.redirects,
      extra: response?.extra,
    );
  }

  dynamic errorInterceptor(DioError dioError) {
    //print(dioError);
    //print("<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}",);
    //print("${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    //print("<-- End error");

    return dioError?.response;
  }
}
