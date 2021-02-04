import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:sw_flutter_app/app/shared/helper/weather_location.dart';
import 'package:sw_flutter_app/app/shared/service/weather_service.dart';
import 'package:sw_flutter_app/app/shared/util/connectivity_network.dart';
import 'package:sw_flutter_app/app/shared/util/generic_result.dart';

part 'weather_repository.g.dart';

@Injectable()
class WeatherRepository extends Disposable {
  final WeatherService service;

  WeatherRepository({this.service});

  Future<GenericResult> getWeatherLocation(Position position) async {
    var network = await ConnectivityNetwork.isInternet();

    if (network.sucesso) {
      var response = await service.get(position.latitude, position.longitude);

      if (response.statusCode < 299) {
        return GenericResult(
          sucesso: true,
          mensagem: "Sucesso",
          data: WeatherLocation.fromJson(response.data),
        );
      } else {
        return GenericResult(
          sucesso: false,
          mensagem: "Ocorreu um erro ao buscar os dados",
        );
      }
    } else {
      return network;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
