import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class WhiteBoxInputField extends StatelessWidget {
  const WhiteBoxInputField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.fontSize = 32,
      this.textColor = AppColors.blackColor,
      this.validator,
      this.onChanged,
      this.readOnly = false,
      this.autofocus = false,
      this.hintTextColor = AppColors.blackColor})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final Color hintTextColor;
  final Color textColor;
  final double fontSize;
  final FormFieldValidator? validator;
  final ValueChanged? onChanged;
  final bool readOnly;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        readOnly: readOnly,
        autofocus: autofocus,
        showCursor: true,
        onChanged: onChanged,
        validator: validator,
        style: TextStyle(fontSize: fontSize, color: textColor),
        cursorColor: Colors.black,
        decoration: new InputDecoration(
            hintMaxLines: 2,
            fillColor: AppColors.whiteGreyColor,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 30, bottom: 11, top: 11, right: 30),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: fontSize, color: hintTextColor)),
      ),
    );
  }
}

class CustomKeyboardWhiteInboxField extends StatelessWidget {
  CustomKeyboardWhiteInboxField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.onChanged,
      this.fontSize = 30})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final double fontSize;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        hintMaxLines: 2,
        contentPadding:
            EdgeInsets.only(left: 30, bottom: 11, top: 0, right: 30),
        fillColor: AppColors.whiteGreyColor,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintText,
        hintStyle:
            TextStyle(color: AppColors.lightGreyColor, fontSize: fontSize),
      ),
      style: TextStyle(fontSize: fontSize),
      autofocus: true,
      showCursor: true,
      readOnly: true,
    );
  }
}
