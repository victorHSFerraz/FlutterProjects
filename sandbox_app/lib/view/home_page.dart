import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sandbox_app/components/custom_text.dart';
import 'package:sandbox_app/model/planet_info.dart';
import 'package:sandbox_app/res/size_config.dart';
import 'package:sandbox_app/view/detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                child: Column(
                  children: [
                    CustomText(
                      text: "Explorar",
                      color: Colors.white,
                      size: 5,
                      fontWeight: FontWeight.bold,
                    ),
                    DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: CustomText(
                            text: "Solar System",
                            color: Colors.black26,
                            size: 2.5,
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: SizeConfig.safeBlockVertical * 60,
                  child: Swiper(
                    itemCount: planets.length,
                    itemWidth: SizeConfig.safeBlockHorizontal * 60,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: SizeConfig.safeBlockHorizontal * 3.5,
                        space: SizeConfig.safeBlockHorizontal * 1.5,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailPage(
                                planetInfo: planets[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: SizeConfig.safeBlockVertical * 12),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: SizeConfig.safeBlockVertical * 12),
                                        CustomText(
                                          text: planets[index].name,
                                          color: Colors.black38,
                                          size: 5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CustomText(
                                          text: 'Solar System',
                                          color: Colors.black38,
                                          size: 2.2,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        SizedBox(height: SizeConfig.safeBlockVertical * 3),
                                        Row(
                                          children: [
                                            CustomText(
                                              text: 'Know more',
                                              color: Colors.deepPurpleAccent,
                                              size: 1.5,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: Colors.deepPurpleAccent,
                                              size: SizeConfig.safeBlockHorizontal * 4,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Hero(
                              tag: planets[index].position,
                              child: Image.asset(planets[index].iconImage),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
