import 'package:fintech_app/components/custom_appbar.dart';
import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/core/models/user_model.dart';
import 'package:fintech_app/screens/chat_screen/chat_screen.dart';
import 'package:fintech_app/screens/coming_soon_screen/mart_screen.dart';
import 'package:fintech_app/screens/home_screen.dart';
import 'package:fintech_app/screens/invite_screen.dart';
import 'package:fintech_app/screens/qr_code_screen/qr_code_screen.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_bottom_navbar.dart';

class DashboardScreen extends StatefulWidget {
  final UserModel? userModel;
  final bool? guest;
  final String? pin;
  const DashboardScreen({Key? key, this.userModel, this.guest, this.pin})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  Widget getCurrentScreen(
      int index, UserModel? userModel, bool? guest, String? pin) {
    Widget widget = Container();
    switch (index) {
      case 0:
        widget = HomeScreen(userModel: userModel, guest: guest, pin: pin);
        break;
      case 1:
        widget = MartScreen();
        break;
      case 3:
        widget = InviteScreen();
        break;
      case 4:
        widget = Container();
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        userModel: widget.userModel,
        title: 'FinTech Mobile',
        isHomeAppBar: true,
      ),
      body: getCurrentScreen(
          _selectedIndex, widget.userModel, widget.guest, widget.pin),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (int index) {
          if (index == 4) {
            NavRouter.push(context, ChatScreen());
            return;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          tooltip: 'Scan to pay',
          backgroundColor: AppColors.blueDark,
          child: SvgPicture.asset(AssetsPath.IC_SCAN),
          onPressed: () {
            NavRouter.push(context, QrCodeScreen());
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
