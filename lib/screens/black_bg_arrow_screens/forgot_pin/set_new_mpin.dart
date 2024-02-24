import 'dart:async';

import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/screens/blue_bg_screens/mpin_screen/pin_form.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';

class SetNewMPINScreen extends StatefulWidget {
  const SetNewMPINScreen({Key? key}) : super(key: key);

  @override
  State<SetNewMPINScreen> createState() => _SetNewMPINScreenState();
}

class _SetNewMPINScreenState extends State<SetNewMPINScreen> {
  final textEditingController = TextEditingController();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
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

  bool isEnable = false;

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
                horizontalPadding: 30.0,
                verticalPadding: 10.0,
                text: 'Create New MPIN',
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                horizontalPadding: 30.0,
                text: 'Enter new  MPIN',
                fontSize: 16,
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PinForm(
                        textEditingController: textEditingController,
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                            if (value.length >= 4) {
                              isEnable = true;
                            } else {
                              isEnable = false;
                            }
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        horizontalPadding: 30.0,
                        text:
                            "Don't use same or sequential characters while creating your MPIN",
                        fontSize: 14,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: CustomText(
                          horizontalPadding: 30,
                          verticalPadding: 5,
                          text: "Forgot MPIN",
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
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
                insertText(myText, textEditingController);
                setState(() {});
              },
              onBackspace: () {
                backspace(textEditingController);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
                width: MediaQuery.of(context).size.width * .8,
                onPress: () {
                  isEnable
                      ? Navigator.of(context).popUntil((route) => route.isFirst)
                      : customToast('Please enter the MPIN');
                  ;
                },
                primaryColor: isEnable == false
                    ? AppColors.whiteColor
                    : AppColors.blueDark,
                title: 'Continue',
                textColor: isEnable == false
                    ? AppColors.blueDark
                    : AppColors.whiteColor,
                alignment: MainAxisAlignment.spaceBetween,
                image: isEnable == false
                    ? AssetsPath.IC_green_line_bottom_button
                    : AssetsPath.IC_white_line_bottom_button),
          ),
        ],
      ),
    );
  }
}
