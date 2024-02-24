import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/custom_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/home_bg_widget.dart';
import 'package:fintech_app/widgets/common_widgets/dot_indicator.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  int selectedLatestUpdateCardsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return HomeBgWidget(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(left: 35),
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: 'Latest Updates',
              color: AppColors.blueDark,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            )),
        SizedBox(
          height: 18,
        ),
        SizedBox(
          height: 160,
          child: PageView(
            onPageChanged: (int page) {
              setState(() {
                selectedLatestUpdateCardsIndex = page;
              });
            },
            children: [
              Container(
                child: Image.asset(AssetsPath.Slider1),
              ),
              Container(
                child: Image.asset(AssetsPath.Slider2),
              ),
              Container(
                child: Image.asset(AssetsPath.Slider3),
              ),
              Container(
                child: Image.asset(AssetsPath.Slider4),
              ),
            ],
          ),
        ),
        BuildDotIndicators(selectedIndex: selectedLatestUpdateCardsIndex),
        SizedBox(height: 25),
        Container(
            width: MediaQuery.of(context).size.width * .6,
            child: CustomText(
              text: 'Invite friends to register on finTech app',
              fontSize: 18,
              color: AppColors.blueDark,
              fontWeight: FontWeight.w600,
            )),
        SizedBox(height: 50),
        Container(
            width: MediaQuery.of(context).size.width * .6,
            height: 50,
            child: CustomButton(
                title: 'invite Friends',
                onPressed: () {
                  share(context);
                },
                isOutlined: false,
                textColor: AppColors.whiteColor))
      ],
    ));
  }

  void share(BuildContext context) {
    String data =
        'Please download Fintech app to transfer your money without any hassle.';
    Share.share(data);
  }
}
