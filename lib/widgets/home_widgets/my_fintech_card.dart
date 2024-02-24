import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyFintechCard extends StatelessWidget {
  const MyFintechCard({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.4),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 70,
        width: 78,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 10,
                  color: AppColors.blueDark,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

