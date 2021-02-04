import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sw_flutter_app/app/modules/financas/financas_controller.dart';
import 'package:sw_flutter_app/app/modules/financas/financas_module.dart';

void main() {
  initModule(FinancasModule());
  // FinancasController financas;
  //
  setUp(() {
    //     financas = FinancasModule.to.get<FinancasController>();
  });

  group('FinancasController Test', () {
    //   test("First Test", () {
    //     expect(financas, isInstanceOf<FinancasController>());
    //   });

    //   test("Set Value", () {
    //     expect(financas.value, equals(0));
    //     financas.increment();
    //     expect(financas.value, equals(1));
    //   });
  });
}
