import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sw_flutter_app/app/shared/util/constant.dart';

part 'geo_service.g.dart';

@Injectable()
class GeoService extends Disposable {
  //dispose will be called automatically
  final DioForNative _dio;

  GeoService(this._dio);

  Future<Response> get() async {
    var response = await _dio.get(
        "https://api.hgbrasil.com/geoip?key=${ConstantApp.token}&address=remote&precision=false");

    return response;
  }

  @override
  void dispose() {}
}
