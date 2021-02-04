import 'geo_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'geo_page.dart';

class GeoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $GeoController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => GeoPage()),
      ];

  static Inject get to => Inject<GeoModule>.of();
}
