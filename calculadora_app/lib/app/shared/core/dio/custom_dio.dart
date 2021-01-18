import 'package:calculadora_app/app/shared/util/constant_app.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class CustomDio extends DioForNative {
  CustomDio([BaseOptions options]) : super(options) {
    options.baseUrl = ConstantApp.BASE_URL;
    options.connectTimeout = ConstantApp.connectTimeout;
    options.receiveTimeout = ConstantApp.receiveTimeout;
    options.responseType = ResponseType.json;
    options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
  }

  dynamic requestInterceptor(RequestOptions options) async {
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

  dynamic errorInterceptor(DioError dioError,
      {String refreshToken = ""}) async {
    //print(dioError);
    //print("<-- ${dioError.message} ${(dioError.response?.request != null ? (dioError.response.request.baseUrl + dioError.response.request.path) : 'URL')}",);
    //print("${dioError.response != null ? dioError.response.data : 'Unknown Error'}");
    //print("<-- End error");

    return dioError?.response;
  }
}
