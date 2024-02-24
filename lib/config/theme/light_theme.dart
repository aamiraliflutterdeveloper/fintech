import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Color(0xFF255AA8),
  scaffoldBackgroundColor: Colors.white,


  //  *************************************** Bottom nav bar theme ***************************************
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,

      /// Selected items style
      selectedItemColor: Colors.white,
      // selectedLabelStyle: Styles.getCustomStyle(12, AppColors.kSecondaryColor,
      //     fontWeight: FontWeight.w700),
      selectedIconTheme: const IconThemeData(color: Colors.white, size: 22),

      /// Unselected items style
      unselectedItemColor: Colors.white,
      unselectedLabelStyle:
          TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
      unselectedIconTheme:
          IconThemeData(color: Colors.white.withOpacity(0.8), size: 22)),
);
