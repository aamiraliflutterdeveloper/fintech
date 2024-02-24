import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'fetch_svg.dart';

class MoneyTransferCard extends StatelessWidget {
  final String name;
  final String icon;
  const MoneyTransferCard({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 2,
          shadowColor: AppColors.greyColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: 68,
            height: 62,
            padding: EdgeInsets.all(16),
            child: SvgImage(
              path: icon,
              color: AppColors.blueDark,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        CustomText(
          text: name,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: AppColors.blueDark,
        ),
      ],
    );
  }
}
