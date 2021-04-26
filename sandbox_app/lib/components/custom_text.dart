import 'package:flutter/material.dart';
import 'package:sandbox_app/res/size_config.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;

  const CustomText({Key key, this.text, this.color, this.size, this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: SizeConfig.safeBlockVertical * size,
          fontWeight: fontWeight),
    );
  }
}
