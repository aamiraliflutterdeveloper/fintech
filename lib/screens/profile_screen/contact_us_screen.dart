import 'package:fintech_app/components/custom_appbar.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/home_bg_widget.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/fetch_svg.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Contact us'),

      body: HomeBgWidget(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            SvgImage(
              path: AssetsPath.IC_PHONE,
              width: 55,
              height: 55,
            ),
            SizedBox(
              height: 50,
            ),
            CustomText(
              text: '24/ 7 Call Center:',
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: '03XXXXXXXXX',
              fontSize: 22,
              color: Color(0xFF255AA8),
            ),
            SizedBox(
              height: 50,
            ),
            SvgImage(
              path: AssetsPath.IC_EMAIL,
              width: 45,
              height: 45,
            ),
            SizedBox(
              height: 30,
            ),
            CustomText(
              text: 'Email:',
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'YourName@website.com',
              fontSize: 22,
              color: Color(0xFF255AA8),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'feedback@website.com',
              fontSize: 22,
              color: Color(0xFF255AA8),
            ),
          ],
        ),
      ),
    );
  }
}
