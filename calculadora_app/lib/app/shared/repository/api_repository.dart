import 'package:calculadora_app/app/shared/helper/ResultadoDTO.dart';
import 'package:calculadora_app/app/shared/service/api_service.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'api_repository.g.dart';

@Injectable()
class ApiRepository extends Disposable {
  final DioForNative client;

  ApiRepository(this.client);

  Future get() async {}

  Future<ResultadoDTO> setResultado() async {
    final response = await client
        .post('https://dev.api.amanet.com.br/v1/Calculadora/Calculo');

    var data = response.data;

    return ResultadoDTO.fromJson(data);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
