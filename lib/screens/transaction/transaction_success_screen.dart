import 'dart:typed_data';

import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/BlueBackgroundWidget.dart';
import 'package:fintech_app/global_widgets/animated_check.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import '../../constants/app_colors.dart';
import '../../global_widgets/custom_toast.dart';

class TransactionSuccessScreen extends StatelessWidget {
  TransactionSuccessScreen({Key? key}) : super(key: key);

  final controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller,
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            return Future<bool>.value(false);
          },
          child: Scaffold(
            body: BlueBackgroundWidget(
                child: Column(
              children: [
                ScreenWidget(),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomElevatedButton(
                          onPress: () async {
                            final image = await controller.capture();
                            if (image == null) return;
                            await saveImage(image);
                            customToast('You have taken ScreenShot');
                          },
                          height: 48,
                          textPadding: 0,
                          title: 'screenshot',
                          primaryColor: AppColors.mediumBlueColor,
                          borderColor: AppColors.mediumBlueColor,
                          textColor: AppColors.whiteColor,
                          alignment: MainAxisAlignment.center,
                          borderRadius: 0,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomElevatedButton(
                          onPress: () async {
                            share(context);
                          },
                          height: 48,
                          textPadding: 0,
                          title: 'Share',
                          textColor: AppColors.whiteColor,
                          alignment: MainAxisAlignment.center,
                          borderRadius: 0,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomElevatedButton(
                          textPadding: 0,
                          primaryColor: AppColors.mediumBlueColor,
                          borderColor: AppColors.mediumBlueColor,
                          onPress: () {
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          height: 48,
                          title: 'OK',
                          textColor: AppColors.whiteColor,
                          alignment: MainAxisAlignment.center,
                          borderRadius: 0,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }

  void share(BuildContext context) {
    String data = 'This is from Fintech';
    Share.share(data);
  }

  /// saving image method
  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now();
    final String name = 'Fintech Transaction ScreenShot $time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);

    return result['filePath'];
  }
}

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        AnimatedCheck(),
        SizedBox(
          height: 30,
        ),
        CustomText(
          text: 'Transaction Successful',
          fontSize: 24,
          color: Colors.white,
        ),
        SizedBox(
          height: 15,
        ),
        CustomText(
          text: 'Zayn Oskar',
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: 'Money Transferred',
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 15,
        ),
        CustomText(
          text: 'Rs.50,000',
          fontSize: 40,
          color: Color(0xFF255AA8),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: 'to',
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: 'Davis john',
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: '03XXXXXXXXX',
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        SvgImage(path: AssetsPath.IC_APP_LOGO),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: 'FinTech Mobile Wallet',
          fontSize: 28,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: '15 Feb 2022 10:30 PM',
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 10,
        ),
        CustomText(
          text: 'Transaction ID (TID) : 993423',
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
