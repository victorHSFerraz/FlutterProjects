import 'financas_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'financas_page.dart';

class FinancasModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $FinancasController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => FinancasPage()),
      ];

  static Inject get to => Inject<FinancasModule>.of();
}
