import 'shared/service/geo_service.dart';
import 'shared/repository/geo_repository.dart';
import 'package:dio/dio.dart';
import 'package:sw_flutter_app/app/modules/financas/finance_module.dart';
import 'package:sw_flutter_app/app/shared/core/custom_dio.dart';
import 'package:sw_flutter_app/app/shared/core/http.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:sw_flutter_app/app/app_widget.dart';

import 'modules/clima/clima_module.dart';
import 'modules/geo/geo_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $GeoService,
        $GeoRepository,
        $AppController,
        Bind(
          (i) => CustomDio(BaseOptions()),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter("/clima", module: ClimaModule()),
        ModularRouter("/financas", module: FinanceModule()),
        ModularRouter("/geo", module: GeoModule()),
        //ModularRouter("/home", module: HomeModule()),
        //ModularRouter("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
