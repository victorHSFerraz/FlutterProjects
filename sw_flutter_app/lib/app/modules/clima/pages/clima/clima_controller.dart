import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sw_flutter_app/app/shared/helper/weather_location.dart';
import 'package:sw_flutter_app/app/shared/repository/weather_repository.dart';
import 'package:sw_flutter_app/app/shared/util/toast_message.dart';

part 'clima_controller.g.dart';

@Injectable()
class ClimaController = _ClimaControllerBase with _$ClimaController;

abstract class _ClimaControllerBase with Store {
  final WeatherRepository repository;
  _ClimaControllerBase({this.repository});

  @observable
  bool loading = false;

  @observable
  String title = "";

  @observable
  List<Forecast> list = List();

  @action
  Future<void> get(Position position) async {
    loading = true;

    var generic = await repository.getWeatherLocation(position);

    if (generic.sucesso) {
      var result = (generic.data as WeatherLocation).results;
      title = result.city;
      list = result.forecast;
    } else {
      ToastMessage.notificationError("Oops!", generic.mensagem);
    }

    loading = false;
  }
}
