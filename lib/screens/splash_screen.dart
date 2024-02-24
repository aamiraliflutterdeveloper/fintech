import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/dashboard_screen.dart';
import 'package:fintech_app/screens/intro_screen/intro_screen.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/data/repositories/userDataRepository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserDataRepository authCubit = UserDataRepository();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      bool isLoggedIn = await authCubit.isLoggedIn();

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var storedPhone = sharedPreferences.getString('phone');

      if (isLoggedIn == true || storedPhone != null) {
        NavRouter.pushReplacement(
            context,
            DashboardScreen(
              userModel: authCubit.userModel,
            ));
      } else {
        NavRouter.pushReplacement(context, IntroScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mediumBlueColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AssetsPath.splash,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          SizedBox(
            child: SvgPicture.asset('assets/images/svg/app_icon.svg'),
          ),
        ],
      ),
    );
  }
}
