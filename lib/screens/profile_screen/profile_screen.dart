import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/core/models/user_model.dart';
import 'package:fintech_app/global_widgets/profile_card.dart';
import 'package:fintech_app/global_widgets/profile_widget.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/edit_email_screen/edit_email_screen.dart';
import 'package:fintech_app/screens/profile_screen/contact_us_screen.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/custom_text.dart';
import '../black_bg_arrow_screens/old_mpn_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileWidget(userModel: widget.userModel),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: CustomText(
                    text: 'Email',
                    color: Color(0xFF323232),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ProfileCard(
                  onTabbed: () {
                    NavRouter.push(
                        context, EditEmailScreen(userModel: widget.userModel));
                  },
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  title: 'Email',
                  subTitle: widget.userModel != null
                      ? widget.userModel!.emailAddress
                      : 'Email',
                  onPressed: () {
                    setState(() {
                      print(widget.userModel!.id);
                    });
                  },
                  icon: AssetsPath.IC_EMAIL,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: CustomText(
                    text: 'MPIN',
                    color: Color(0xFF323232),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ProfileCard(
                  onTabbed: () {
                    NavRouter.push(context, OldMpnScreen());
                  },
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  title: 'MPIN',
                  isMpin: true,
                  subTitle: '....',
                  onPressed: () {
                    print('Edit pressed');
                  },
                  icon: AssetsPath.IC_PASSWORD,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: CustomText(
                    text: 'CNIC',
                    color: Color(0xFF323232),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ProfileCard(
                  onTabbed: () {
                    print('edit');
                  },
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  title: 'CNIC',
                  subTitle: widget.userModel != null
                      ? widget.userModel!.phoneNumber
                      : '12345-**********-7',
                  expDate: '01/01/2023',
                  onPressed: () {
                    print('Edit pressed');
                  },
                  icon: AssetsPath.IC_ID_CARD,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: CustomText(
                    text: 'Bio Matric',
                    color: Color(0xFF323232),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ProfileCard(
                  onTabbed: () {},
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  isBioMetric: true,
                  title: 'Bio Metric',
                  onPressed: () {
                    print('Edit pressed');
                  },
                  icon: AssetsPath.IC_BIO_MATRIC,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: CustomText(
                    text: 'Contact Us',
                    color: Color(0xFF323232),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ProfileCard(
                  onTabbed: () {
                    print('Forward Icon tabbed');
                    NavRouter.push(context, ContactUsScreen());
                  },
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  isContactUs: true,
                  title: 'Contact Us',
                  onPressed: () {
                    NavRouter.push(context, ContactUsScreen());
                  },
                  icon: AssetsPath.IC_PHONE,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
