import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'ios_controller.g.dart';

@Injectable()
class IosController = _IosControllerBase with _$IosController;

abstract class _IosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
