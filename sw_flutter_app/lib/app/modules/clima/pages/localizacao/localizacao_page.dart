import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sw_flutter_app/app/shared/util/ripple.dart';
import 'localizacao_controller.dart';

class LocalizacaoPage extends StatefulWidget {
  const LocalizacaoPage({Key key}) : super(key: key);

  @override
  _LocalizacaoPageState createState() => _LocalizacaoPageState();
}

class _LocalizacaoPageState
    extends ModularState<LocalizacaoPage, LocalizacaoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(
          builder: (context) {
            return controller.loading
                ? CircularProgressIndicator()
                : GestureDetector(
                    onTap: () => controller.getLocation(),
                    child: RipplesAnimation(
                      icon: Icon(
                        MdiIcons.mapMarker,
                        color: Colors.white,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
