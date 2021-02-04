import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:sw_flutter_app/app/shared/util/constant.dart';

part 'weather_service.g.dart';

@Injectable()
class WeatherService extends Disposable {
  final DioForNative _dio;

  WeatherService(this._dio);

  Future<Response> get(double latitude, double longitude) async {
    var response = await _dio.get(
        "?key=${ConstantApp.token}&lat=$latitude&lon=$longitude&user_ip=remote");

    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
