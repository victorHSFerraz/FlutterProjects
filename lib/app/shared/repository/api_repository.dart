import 'package:calculadora_app/app/shared/service/api_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'api_repository.g.dart';

@Injectable()
class ApiRepository extends Disposable {
  final ApiService _service;

  ApiRepository(this._service);

  Future get() async {}

  //dispose will be called automatically
  @override
  void dispose() {}
}
