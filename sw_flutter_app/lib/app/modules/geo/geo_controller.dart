import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sw_flutter_app/app/shared/helper/geo_helper.dart';
import 'package:sw_flutter_app/app/shared/repository/geo_repository.dart';
import 'package:sw_flutter_app/app/shared/util/toast_message.dart';

part 'geo_controller.g.dart';

@Injectable()
class GeoController = _GeoControllerBase with _$GeoController;

abstract class _GeoControllerBase with Store {
  final GeoRepository repository;
  _GeoControllerBase({this.repository});

  @observable
  bool loading = false;

  @observable
  GeoHelper helper;

  @action
  Future<void> get() async {
    loading = true;

    var generic = await repository.get();

    if (generic.sucesso) {
      helper = generic.data as GeoHelper;
    } else {
      ToastMessage.notificationError("Oops!", generic.mensagem);
    }

    loading = false;
  }
}
