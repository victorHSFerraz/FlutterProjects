import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsivity_app/app/shared/util/size_config.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: SingleChildScrollView(
              //padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
              child: Column(
                children: [
                  // Avatar //
                  Container(
                    //color: Colors.orange,
                    height: SizeConfig.safeBlockVertical * 20,
                    width: SizeConfig.safeBlockHorizontal * 95,
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: SizeConfig.safeBlockHorizontal * 9,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                child: Icon(
                                  Icons.person,
                                  size: SizeConfig.safeBlockHorizontal * 15,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Container Nome e Rua //
                        Container(
                          padding: EdgeInsets.only(
                              left: SizeConfig.safeBlockHorizontal * 1),
                          //color: Colors.green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Container()),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "Olá Victor",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 6,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "R Prof João Falarz, 555",
                                    style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                4.2),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                        // Botão Ver Saldo //
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: SizeConfig.blockSizeHorizontal * 7),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              height: SizeConfig.blockSizeVertical * 4.5,
                              width: SizeConfig.blockSizeHorizontal * 25,
                              decoration: BoxDecoration(
                                  //color: Colors.purple,
                                  border: Border.all(color: Colors.black)),
                              child: FlatButton(
                                color: Colors.white,
                                child: Text(
                                  "Ver saldo",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal * 3,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
