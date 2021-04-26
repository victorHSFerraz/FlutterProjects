import 'package:flutter/material.dart';
import 'package:sandbox_app/components/custom_text.dart';
import 'package:sandbox_app/model/planet_info.dart';
import 'package:sandbox_app/res/size_config.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: SizeConfig.safeBlockVertical * 35),
                        CustomText(
                          text: planetInfo.name ?? "",
                          color: Colors.grey,
                          size: 6,
                          fontWeight: FontWeight.w900,
                        ),
                        CustomText(
                          text: "Solar System",
                          color: Colors.grey,
                          size: 3,
                          fontWeight: FontWeight.w300,
                        ),
                        Divider(
                          color: Colors.black38,
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 3),
                        CustomText(
                          text: planetInfo.description ?? "",
                          color: Colors.grey,
                          size: 1.8,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: SizeConfig.safeBlockVertical * 3),
                        Divider(
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
                    child: CustomText(
                      text: "Gallery",
                      color: Colors.black45,
                      size: 3,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  Container(
                    height: SizeConfig.safeBlockVertical * 30,
                    padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 5),
                    child: ListView.builder(
                      itemCount: planetInfo.images.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              planetInfo.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: -60,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
              ),
            ),
            Positioned(
              top: 60,
              left: 15,
              child: CustomText(
                text: planetInfo.position.toString(),
                color: Colors.grey.withOpacity(0.10),
                size: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
