import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../utils/nav_router.dart';
import '../enter_agent_mobile_number.dart';

class AgentToCNICScreen extends StatefulWidget {
  AgentToCNICScreen({Key? key}) : super(key: key);

  @override
  State<AgentToCNICScreen> createState() => _AgentToCNICScreenState();
}

class _AgentToCNICScreenState extends State<AgentToCNICScreen> {
  final TextEditingController pinController = TextEditingController();

  bool isButtonActive = false;
  isButtonEnabled() {
    pinController.addListener(() {
      final isButtonActive = pinController.text.length >= 13;
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              CustomText(
                horizontalPadding: 30,
                verticalPadding: 10,
                text: 'Agent  to CNIC',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Enter your CNIC',
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
                      CustomKeyboardWhiteInboxField(
                        controller: pinController,
                        hintText: 'XXXXX-XXXXXXX-X',
                        onChanged: (value) {
                          setState(() {
                            if (value.length >= 13) {
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
                        height: 30,
                      ),
                      CustomText(
                        horizontalPadding: 30.0,
                        text: "CNIC will be 13 digits",
                        fontSize: 14,
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
                insertText(myText, pinController);
                setState(() {});
              },
              onBackspace: () {
                backspace(pinController);
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
                      ? NavRouter.push(context, EnterAgentMobileNumber())
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
