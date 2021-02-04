import 'package:dio/dio.dart';
import 'package:sw_flutter_app/app/shared/core/custom_dio.dart';

class Http extends CustomDio {
  Http(BaseOptions options) : super(options) {
    interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) => requestInterceptor(options),
      onResponse: (Response response) => responseInterceptor(response),
      onError: (DioError dioError) => errorInterceptor(dioError),
    ));
  }
}
