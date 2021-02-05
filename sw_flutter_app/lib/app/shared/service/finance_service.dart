import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sw_flutter_app/app/shared/util/constant.dart';

part 'finance_service.g.dart';

@Injectable()
class FinanceService extends Disposable {
  final DioForNative _dio;

  FinanceService(this._dio);

  Future<Response> get(double latitude, double longitude) async {
    var response =
        await _dio.get("https://api.hgbrasil.com/finance?${ConstantApp.token}");

    return response;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
