import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'clima_controller.dart';

class ClimaPage extends StatefulWidget {
  final Position position;
  const ClimaPage({Key key, this.position}) : super(key: key);

  @override
  _ClimaPageState createState() => _ClimaPageState();
}

class _ClimaPageState extends ModularState<ClimaPage, ClimaController> {
  getMethod() {
    controller.get(widget.position);
  }

  @override
  void initState() {
    getMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Observer(
          builder: (context) {
            return Text(
              controller.title,
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              MdiIcons.reload,
              color: Colors.white,
            ),
            onPressed: () => getMethod(),
          )
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
              if (controller.list.length != 0) {
                return ListView.builder(
                  padding: const EdgeInsets.all(2.0),
                  itemCount: controller.list.length,
                  itemBuilder: (ctx, index) {
                    var item = controller.list[index];

                    return Card(
                      child: ListTile(
                        title: Text(item.date),
                        subtitle: Text(item.description),
                      ),
                    );
                  },
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
