import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:sw_flutter_app/app/shared/util/generic_result.dart';

class ConnectivityNetwork {
  static List<AddressCheckOptions> list = List.unmodifiable([
    AddressCheckOptions(
      InternetAddress('1.1.1.1'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('1.0.0.1'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.4.4'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.8.8.8'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.220.220'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('208.67.222.222'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('8.26.56.26'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('9.9.9.9'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('64.6.65.6'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('13.239.157.177'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('91.239.100.100'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('185.228.168.168'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('77.88.8.7'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('156.154.70.1'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('198.101.242.72'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
    AddressCheckOptions(
      InternetAddress('176.103.130.130'),
      port: DataConnectionChecker.DEFAULT_PORT,
      timeout: DataConnectionChecker.DEFAULT_TIMEOUT,
    ),
  ]);

  static Future<GenericResult> isInternet() async {
    var dataConnectionChecker = DataConnectionChecker();

    //dataConnectionChecker.addresses = list;

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // Estou conectado a uma rede móvel, verifique se há realmente uma conexão de rede.
      if (await dataConnectionChecker.hasConnection) {
        return GenericResult(
          sucesso: true,
          mensagem:
              "Dados móveis detectados e conexão com a internet confirmada.",
        );
      } else {
        return GenericResult(
          sucesso: false,
          mensagem:
              "Dados móveis detectados, mas nenhuma conexão com a Internet encontrada.",
        );
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // Estou conectado a uma rede WIFI, verifique se há realmente uma conexão de rede.
      if (await dataConnectionChecker.hasConnection) {
        return GenericResult(
          sucesso: true,
          mensagem: "Wifi detectado e ligação à Internet confirmada.",
        );
      } else {
        return GenericResult(
          sucesso: false,
          mensagem:
              "Wifi detectado, mas nenhuma conexão com a Internet encontrada.",
        );
      }
    } else {
      return GenericResult(
        sucesso: false,
        mensagem:
            "Nenhum dados móveis ou wifi detectado, nenhuma conexão de internet encontrada.",
      );
    }
  }
}
