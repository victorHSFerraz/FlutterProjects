import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'finance_controller.g.dart';

@Injectable()
class FinanceController = _FinanceControllerBase with _$FinanceController;

abstract class _FinanceControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
