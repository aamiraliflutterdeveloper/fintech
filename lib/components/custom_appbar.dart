import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/screens/profile_screen/profile_screen.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/models/user_model.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      this.isHomeAppBar = false,
      required this.title,
      this.userModel})
      : super(key: key);
  final bool isHomeAppBar;
  final String title;
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blueDark,
      leading: IconButton(
          splashRadius: 24,
          onPressed: () {
            isHomeAppBar
                ? NavRouter.push(
                    context,
                    ProfileScreen(
                      userModel: userModel,
                    ))
                : Navigator.pop(context);
          },
          icon: isHomeAppBar == false
              ? Icon(Icons.keyboard_backspace_outlined)
              : SvgPicture.asset(
                  AssetsPath.IC_MENU,
                  height: 16,
                  width: 16,
                )),
      title: Text(title),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
