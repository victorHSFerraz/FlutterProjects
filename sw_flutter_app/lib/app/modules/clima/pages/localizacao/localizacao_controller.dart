import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sw_flutter_app/app/shared/util/generic_result.dart';
import 'package:sw_flutter_app/app/shared/util/toast_message.dart';

part 'localizacao_controller.g.dart';

@Injectable()
class LocalizacaoController = _LocalizacaoControllerBase
    with _$LocalizacaoController;

abstract class _LocalizacaoControllerBase with Store {
  Future<GenericResult> _determinePosition() async {
    loading = true;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      loading = false;

      return GenericResult(
        mensagem: 'Os serviços de localização estão desativados.',
        sucesso: false,
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      loading = false;

      return GenericResult(
        mensagem:
            'As permissões de localização são negadas permanentemente, não podemos solicitar permissões.',
        sucesso: false,
      );
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        loading = false;

        return GenericResult(
          mensagem:
              'As permissões de localização são negadas (valor real: $permission).',
          sucesso: false,
        );
      }
    }

    loading = false;

    return GenericResult(
      mensagem: "Sucesso",
      sucesso: true,
      data: await Geolocator.getCurrentPosition(),
    );
  }

  @observable
  bool loading = false;

  @action
  Future<void> getLocation() async {
    GenericResult generic = await _determinePosition();

    if (generic.sucesso) {
      Position position = generic.data;

      Modular.to.pushReplacementNamed("/clima/clima-home", arguments: position);
    } else {
      ToastMessage.notificationError("Oops!", generic.mensagem);
    }
  }
}
