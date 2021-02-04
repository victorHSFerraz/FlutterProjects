import 'package:sw_flutter_app/app/modules/clima/pages/clima/clima_controller.dart';
import 'package:sw_flutter_app/app/modules/clima/pages/clima/clima_page.dart';
import 'package:sw_flutter_app/app/modules/clima/pages/localizacao/localizacao_controller.dart';
import 'package:sw_flutter_app/app/modules/clima/pages/localizacao/localizacao_page.dart';
import 'package:sw_flutter_app/app/shared/core/custom_dio.dart';
import 'package:sw_flutter_app/app/shared/repository/weather_repository.dart';
import 'package:sw_flutter_app/app/shared/service/weather_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClimaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => WeatherService(i.get<CustomDio>()),
        ),
        Bind(
          (i) => WeatherRepository(service: i.get<WeatherService>()),
        ),
        Bind(
          (i) => ClimaController(repository: i.get<WeatherRepository>()),
        ),
        $LocalizacaoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => LocalizacaoPage(),
        ),
        ModularRouter(
          '/clima-home',
          child: (_, args) => ClimaPage(
            position: args.data,
          ),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<ClimaModule>.of();
}
