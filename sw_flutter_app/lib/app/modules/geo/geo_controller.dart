import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'geo_controller.g.dart';

@Injectable()
class GeoController = _GeoControllerBase with _$GeoController;

abstract class _GeoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
