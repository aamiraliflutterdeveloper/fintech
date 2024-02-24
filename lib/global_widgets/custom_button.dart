import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.isOutlined = true,
    this.textColor = Colors.white,
    required this.title,
    required this.onPressed,
  });

  final bool isOutlined;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      style: TextButton.styleFrom(
        backgroundColor: isOutlined ? Colors.transparent : AppColors.blueDark,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blueDark, width: 2),
          borderRadius: BorderRadius.circular(
            40,
          ),
        ),
      ),
    );
  }
}
