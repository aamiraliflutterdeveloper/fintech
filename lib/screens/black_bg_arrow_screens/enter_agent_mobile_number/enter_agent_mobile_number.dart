import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';
import '../../../global_widgets/custom_elevated_button.dart';
import '../../../global_widgets/custom_toast.dart';
import '../../../utils/nav_router.dart';
import '../agent_to_cnic_screen/agent_to_cnic_screen.dart';

class EnterAgentMobileNumber extends StatefulWidget {
  EnterAgentMobileNumber({Key? key}) : super(key: key);

  @override
  State<EnterAgentMobileNumber> createState() => _EnterAgentMobileNumberState();
}

class _EnterAgentMobileNumberState extends State<EnterAgentMobileNumber> {
  final agentMobileController = TextEditingController();

  bool isButtonActive = false;

  isButtonEnabled() {
    agentMobileController.addListener(() {
      final isButtonActive = agentMobileController.text.length >= 3;
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
                text: 'Enter Agent Mobile Number',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                verticalPadding: 5,
                text: 'Enter Number or search recipient',
                fontSize: 16,
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomKeyboardWhiteInboxField(
                          controller: agentMobileController,
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
                        SizedBox(
                          height: 20,
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
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                onPress: () {
                  isButtonActive == true
                      ? NavRouter.pushReplacement(context, AgentToCNICScreen())
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
