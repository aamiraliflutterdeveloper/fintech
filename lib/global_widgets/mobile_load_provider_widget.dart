import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class MobileLoadProviderWidget extends StatelessWidget {
  final String name;
  final String icon;
  const MobileLoadProviderWidget({
    required this.name,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 4,
        ),
        CustomText(
          text: name,
          fontSize: 16,
          color: AppColors.greyColor,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
