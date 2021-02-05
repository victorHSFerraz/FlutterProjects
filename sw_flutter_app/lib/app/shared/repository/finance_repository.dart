import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sw_flutter_app/app/shared/helper/finance_helper.dart';
import 'package:sw_flutter_app/app/shared/service/finance_service.dart';
import 'package:sw_flutter_app/app/shared/util/connectivity_network.dart';
import 'package:sw_flutter_app/app/shared/util/generic_result.dart';

part 'finance_repository.g.dart';

@Injectable()
class FinanceRepository extends Disposable {
  final FinanceService service;

  FinanceRepository({this.service});

  Future<GenericResult> getFinance() async {
    var network = await ConnectivityNetwork.isInternet();

    if (network.sucesso) {
      var response = await service.get();

      if (response.statusCode < 299) {
        return GenericResult(
          sucesso: true,
          mensagem: "Sucesso",
          data: FinanceHelper.fromJson(response.data),
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
