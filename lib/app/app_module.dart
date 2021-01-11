import 'package:calculadora_app/app/app_widget.dart';
import 'package:calculadora_app/app/pages/android/android_page.dart';
import 'package:calculadora_app/app/shared/core/dio/http.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'pages/android/android_controller.dart';
import 'pages/ios/ios_controller.dart';
import 'shared/repository/api_repository.dart';
import 'shared/service/api_service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => IosController(),
        ),
        Bind(
          (i) => AndroidController(i.get<ApiRepository>()),
        ),
        Bind(
          (i) => ApiRepository(i.get<Dio>()),
        ),
        Bind(
          (i) => ApiService(i.get<Http>()),
        ),
        Bind(
          (i) => Http(BaseOptions()),
        ),
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => AndroidPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
