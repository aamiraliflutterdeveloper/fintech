import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/dashboard_screen.dart';
import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/models/user_model.dart';
import '../screens/black_bg_arrow_screens/your_account_screen.dart';

class ProfileWidget extends StatelessWidget {
  final UserModel? userModel;
  const ProfileWidget({Key? key, this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(),
          child: Image.asset(
            'assets/profile_pic.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Zayn Oskar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    PopupMenuButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                      offset: Offset(0, 40),
                      initialValue: 2,
                      child: Center(
                        child: Icon(
                          Icons.more_vert,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(2, (index) {
                          return PopupMenuItem(
                            value: index,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () async {
                                    if (index == 1) {
                                      // FirebaseAuth.instance.signOut();
                                      // FirebaseAuth.instance.authStateChanges();
                                      SharedPreferences sharedPreferences =
                                          await SharedPreferences.getInstance();
                                      sharedPreferences.remove('pin');
                                      NavRouter.pushAndRemoveUntil(
                                          context,
                                          DashboardScreen(
                                            userModel: userModel,
                                          ));
                                      print(userModel!.fullName);
                                      print(userModel!.id);
                                    } else {
                                      NavRouter.push(
                                          context,
                                          YourAccountScreen(
                                            userModel: userModel,
                                          ));
                                    }
                                  },
                                  leading: Text(
                                    index == 0 ? 'Your Account' : 'Log Out',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                if (index == 0) Divider(),
                              ],
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
                Text('Account: 03XXXXXXXXXX',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: SvgImage(
                width: 25,
                path: AssetsPath.IC_ARROW_BACK,
                color: Color(0xFF255AA8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
