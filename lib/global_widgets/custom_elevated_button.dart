import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.onPress,
      this.width,
      this.height = 55,
      this.primaryColor = AppColors.blueDark,
      this.borderRadius = 60,
      this.borderColor = AppColors.blueDark,
      required this.textColor,
      required this.title,
      this.fontSize = 18,
      this.textPadding = 8.0,
      this.alignment = MainAxisAlignment.spaceBetween,
      this.image})
      : super(key: key);

  final VoidCallback onPress;
  final double? height;
  final double? width;
  final Color primaryColor;
  final double borderRadius;
  final Color borderColor;
  final String title;
  final double fontSize;
  final Color textColor;
  final MainAxisAlignment alignment;
  final String? image;
  final double textPadding;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
          primary: widget.primaryColor,
          side: BorderSide(color: widget.borderColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.textPadding),
            child: Row(
              mainAxisAlignment: widget.alignment,
              children: [
                CustomText(
                  text: widget.title,
                  fontSize: widget.fontSize,
                  color: widget.textColor,
                  fontWeight: FontWeight.w500,
                ),
                widget.image != null
                    ? SvgPicture.asset(widget.image.toString(),
                        width: 25, semanticsLabel: 'bottomButton')
                    : Container(
                        width: 0,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
