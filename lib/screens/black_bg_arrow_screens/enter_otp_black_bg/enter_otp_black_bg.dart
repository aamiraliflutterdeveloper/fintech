import 'dart:async';

import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:fintech_app/screens/blue_bg_screens/otp_screen/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';
import '../../../utils/nav_router.dart';
import '../enter_pin_screen/enter_pin_screen.dart';

class EnterOTPBlackScreen extends StatefulWidget {
  const EnterOTPBlackScreen({Key? key}) : super(key: key);

  @override
  State<EnterOTPBlackScreen> createState() => _EnterOTPBlackScreenState();
}

class _EnterOTPBlackScreenState extends State<EnterOTPBlackScreen>
    with TickerProviderStateMixin {
  TextEditingController otpController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  /// count down data ...
  String? amount;
  AnimationController? _controller;
  int levelClock = 30;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );
    _controller!.forward();
    isButtonEnabled();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    _controller!.dispose();
    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  bool isButtonActive = false;
  isButtonEnabled() {
    otpController.addListener(() {
      final isButtonActive = otpController.text.length >= 8;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      horizontal: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Enter OTP',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                verticalPadding: 5,
                text: 'We sent a code to 030001234567',
                fontSize: 16,
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomKeyboardWhiteInboxField(
                        controller: otpController,
                        hintText: '06330737',
                        onChanged: (value) {
                          setState(() {
                            if (value.length >= 8) {
                              isButtonActive = true;
                              isButtonEnabled();
                            } else {
                              isButtonActive = false;
                            }
                          });
                          print('called');
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CustomText(
                            horizontalPadding: 30,
                            text: "Please don't share your code",
                            fontSize: 14,
                          ),
                          Countdown(
                            animation: StepTween(
                              begin:
                                  levelClock, // THIS IS A USER ENTERED NUMBER
                              end: 0,
                            ).animate(_controller!),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomKeyboardWithThumb(
              onTextInput: (myText) {
                insertText(myText, otpController);
                setState(() {});
              },
              onBackspace: () {
                backspace(otpController);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                onPress: () {
                  isButtonActive == true
                      ? NavRouter.push(context, EnterPinScreen())
                      : customToast('Please fill the form correctly');
                },
                primaryColor: isButtonActive == false
                    ? AppColors.whiteColor
                    : AppColors.blueDark,
                title: 'Continue',
                textColor: isButtonActive == false
                    ? AppColors.blueDark
                    : AppColors.whiteColor,
                fontSize: 18,
                alignment: MainAxisAlignment.spaceBetween,
                image: isButtonActive == false
                    ? AssetsPath.IC_green_line_bottom_button
                    : AssetsPath.IC_white_line_bottom_button),
          )
        ],
      ),
    );
  }
}
