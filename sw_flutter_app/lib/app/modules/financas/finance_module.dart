import 'finance_controller.dart';
import 'finance_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'finance_page.dart';

class FinanceModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $FinanceController,
        $FinanceController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => FinancePage()),
      ];

  static Inject get to => Inject<FinanceModule>.of();
}
