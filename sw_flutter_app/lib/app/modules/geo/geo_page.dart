import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'geo_controller.dart';

class GeoPage extends StatefulWidget {
  final String title;
  const GeoPage({Key key, this.title = "GeoIP"}) : super(key: key);

  @override
  _GeoPageState createState() => _GeoPageState();
}

class _GeoPageState extends ModularState<GeoPage, GeoController> {
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
              if (controller.helper != null) {
                var item = controller.helper.results;
                return CardGeo(item.address, item.region, item.countryName);
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

Widget CardGeo(String seuIp, String estado, String pais) {
  return Center(
    child: Container(
      width: 300.0,
      height: 300.0,
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Seu IP",
            style: TextStyle(color: Colors.white, fontSize: 50.0),
          ),
          Text(
            seuIp,
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                estado,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                ", ",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                pais,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
