import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';
import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';
import '../../../utils/nav_router.dart';
import 'otp_for_forgot_pin.dart';

class NumberForForgotPin extends StatefulWidget {
  NumberForForgotPin({Key? key}) : super(key: key);

  @override
  State<NumberForForgotPin> createState() => _NumberForForgotPinState();
}

class _NumberForForgotPinState extends State<NumberForForgotPin> {
  final mobileNumberController = TextEditingController();

  bool isButtonActive = false;

  isButtonEnabled() {
    mobileNumberController.addListener(() {
      final isButtonActive = mobileNumberController.text.length >= 13;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void initState() {
    isButtonEnabled();
    super.initState();
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
                text: 'Enter your Mobile Number',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                verticalPadding: 2,
                text: 'Enter Number or search recipient',
                fontSize: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4) +
                    EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomKeyboardWhiteInboxField(
                          controller: mobileNumberController,
                          hintText: 'XXXXXXXXXXXXX',
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
                        CustomText(
                          horizontalPadding: 30,
                          text:
                              "Don't\ use same or sequential characters while creating your MPIN",
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomKeyboardWithThumb(
              onTextInput: (myText) {
                insertText(myText, mobileNumberController);
                setState(() {});
              },
              onBackspace: () {
                backspace(mobileNumberController);
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
                      ? NavRouter.pushReplacement(context, OtpForForgotPin())
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
