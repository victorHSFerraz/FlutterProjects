import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'financas_controller.g.dart';

@Injectable()
class FinancasController = _FinancasControllerBase with _$FinancasController;

abstract class _FinancasControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
