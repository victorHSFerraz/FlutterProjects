import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sw_flutter_app/app/shared/helper/finance_helper.dart';
import 'finance_controller.dart';

class FinancePage extends StatefulWidget {
  final String title;
  const FinancePage({Key key, this.title = "Finanças"}) : super(key: key);

  @override
  _FinancesPageState createState() => _FinancesPageState();
}

class _FinancesPageState extends ModularState<FinancePage, FinanceController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    controller.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.reload,
              color: Colors.white,
            ),
            onPressed: () => controller.get(),
          ),
        ],
      ),
      body: Container(
        child: Observer(
          builder: (ctx) {
            if (controller.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (controller.helper != null) {
                var item = controller.helper.results.currencies;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        child: CardMoney(
                          item.bTC.name.toString(),
                          "R\$${item.bTC.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.uSD.name.toString(),
                          "R\$${item.uSD.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.gBP.name.toString(),
                          "R\$${item.gBP.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.eUR.name.toString(),
                          "R\$${item.eUR.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.jPY.name.toString(),
                          "R\$${item.jPY.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.cAD.name.toString(),
                          "R\$${item.cAD.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.aUD.name.toString(),
                          "R\$${item.aUD.buy.toString()}",
                        ),
                      ),
                      Card(
                        child: CardMoney(
                          item.aRS.name.toString(),
                          "R\$${item.aRS.buy.toString()}",
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text("Sem dados encontrados!"),
                );
              }
            }
          },
        ),
      ),
    );
  }
}

Widget CardMoney(String title, String price) {
  return ListTile(
    title: Text(title),
    subtitle: Text(price),
  );
}
