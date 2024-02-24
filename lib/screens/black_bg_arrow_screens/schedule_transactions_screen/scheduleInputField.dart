import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ScheduleInputField extends StatelessWidget {
  const ScheduleInputField({
    Key? key,
    this.hintStyle,
    required this.hintText,
    this.borderColor,
    this.icon,
    this.onTap,
    required this.onChanged,
    this.isSuffix = false,
    this.isReadOnly = false,
    required this.controller,
    this.onSaved,
  }) : super(key: key);
  final Color? borderColor;
  final String hintText;
  final String? hintStyle;
  final TextEditingController controller;
  final String? icon;
  final bool isSuffix;
  final VoidCallback? onTap;
  final bool? isReadOnly;
  final VoidCallback? onSaved;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.5, color: AppColors.greyLastColor),
        ),
      ),
      child: TextFormField(
        onChanged: onChanged,
        readOnly: isReadOnly!,
        onTap: onTap,
        controller: controller,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 30,
          ),
          hintText: hintText,
          hintStyle: new TextStyle(color: const Color(0xFF424242)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
