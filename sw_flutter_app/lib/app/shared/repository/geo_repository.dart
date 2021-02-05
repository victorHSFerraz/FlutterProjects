import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:sw_flutter_app/app/shared/helper/geo_helper.dart';
import 'package:sw_flutter_app/app/shared/service/geo_service.dart';
import 'package:sw_flutter_app/app/shared/util/connectivity_network.dart';
import 'package:sw_flutter_app/app/shared/util/generic_result.dart';

part 'geo_repository.g.dart';

@Injectable()
class GeoRepository extends Disposable {
  final GeoService service;

  GeoRepository({this.service});

  Future<GenericResult> get() async {
    var network = await ConnectivityNetwork.isInternet();

    if (network.sucesso) {
      var response = await service.get();

      if (response.statusCode < 299) {
        return GenericResult(
          sucesso: true,
          mensagem: "Sucesso",
          data: GeoHelper.fromJson(response.data),
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
