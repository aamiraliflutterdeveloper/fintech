import 'dart:io';

import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/profile_card.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/edit_email_screen/edit_email_screen.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../core/models/user_model.dart';
import '../../global_widgets/custom_dialog.dart';
import '../../global_widgets/custom_elevated_button.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/image_picker_manager.dart';
import '../../global_widgets/profile_widget_for_account.dart';
import '../black_bg_arrow_screens/old_mpn_screen.dart';

class YourAccountScreen extends StatefulWidget {
  const YourAccountScreen({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;

  @override
  _YourAccountScreenState createState() => _YourAccountScreenState();
}

class _YourAccountScreenState extends State<YourAccountScreen> {
  bool switchValue = false;

  File? _pickedImage;
  _pickImage() {
    CustomDialogs.showImageSelectionDialog(context, onSelectGallery: () async {
      _pickedImage =
          await ImagePickerManager.getImageFromGallery(context) ?? _pickedImage;
      setState(() {});
    }, onSelectCamera: () async {
      _pickedImage =
          await ImagePickerManager.getImageFromCamera(context) ?? _pickedImage;
      setState(() {});
    });
  }

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
                ProfileWidgetForAccount(),
                InkWell(
                  onTap: () {
                    _pickImage();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text("TAP HERE TO CHANGE PROFILE PHOTO")),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: CustomText(
                    text: 'Name',
                    color: Color(0xFF323232),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ProfileCard(
                  onTabbed: () {
                    NavRouter.push(context, EditEmailScreen());
                  },
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  title: widget.userModel != null
                      ? widget.userModel!.fullName
                      : 'Name',
                  onPressed: () {},
                  icon: AssetsPath.Name,
                ),
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
                    NavRouter.push(context, EditEmailScreen());
                  },
                  onChanged: (value) {
                    setState(() {
                      switchValue = value;
                    });
                  },
                  value: switchValue,
                  title: widget.userModel != null
                      ? widget.userModel!.emailAddress
                      : 'Email',
                  onPressed: () {},
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
                      ? widget.userModel!.idNumber
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
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.bottomCenter,
                  child: CustomElevatedButton(
                      width: MediaQuery.of(context).size.width * .8,
                      onPress: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      primaryColor: AppColors.blueDark,
                      title: 'Save Information ',
                      textColor: AppColors.whiteColor,
                      alignment: MainAxisAlignment.spaceBetween,
                      image: AssetsPath.IC_white_line_bottom_button),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
