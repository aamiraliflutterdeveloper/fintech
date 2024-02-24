import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w400,
        this.horizontalPadding = 0.0,
        this.verticalPadding = 0.0,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize),
      ),
    );
  }
}
