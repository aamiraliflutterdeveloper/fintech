import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomButton extends StatelessWidget {
  CustomBottomButton({
    Key? key,
    this.onpressed,
    this.bgColor,
    this.textColor,
    this.color,
    required this.text,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.borderColor,
    this.fontSize,
    this.image,
    this.semanticsLabel,
  }) : super(key: key);
  var onpressed;
  Color? bgColor;
  Color? borderColor;
  Color? color;
  String text;
  Color? textColor;
  final double? fontSize;
  final String? image;
  String? semanticsLabel;
  MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 57.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: bgColor,
            border: Border.all(color: borderColor!, width: 2)),
        child: FlatButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: mainAxisAlignment!,
              children: [
                Text(
                  text.toString(),
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
                image == null
                    ? Container()
                    : SvgPicture.asset(image.toString(),
                        width: 25, semanticsLabel: semanticsLabel),
              ],
            ),
          ),
          textColor: color,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: onpressed,
        ),
      ),
    );
  }
}
