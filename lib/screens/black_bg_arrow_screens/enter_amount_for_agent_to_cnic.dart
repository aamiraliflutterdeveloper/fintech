import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/custom_white_box.dart';
import '../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';
import 'agent_to_cnic_screen/agent_to_cnic_screen.dart';

class EnterAmountForAgentToCnic extends StatefulWidget {
  EnterAmountForAgentToCnic({Key? key}) : super(key: key);

  @override
  State<EnterAmountForAgentToCnic> createState() =>
      _EnterAmountForAgentToCnicState();
}

class _EnterAmountForAgentToCnicState extends State<EnterAmountForAgentToCnic> {
  final amountController = TextEditingController();

  bool isButtonActive = false;

  isButtonEnabled() {
    amountController.addListener(() {
      final isButtonActive = amountController.text.length >= 3;
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: CustomText(
                  text: 'Enter Amount',
                  fontSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: CustomText(
                  text: 'Enter amount to sent to :',
                  fontSize: 16,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                ),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomKeyboardWhiteInboxField(
                        controller: amountController,
                        hintText: 'Rs.00',
                        onChanged: (value) {
                          setState(() {
                            if (value.length >= 3) {
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
                            'Dont use same or sequential characters while creating your MPIN',
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
                insertText(myText, amountController);
                setState(() {});
              },
              onBackspace: () {
                backspace(amountController);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
              width: MediaQuery.of(context).size.width * .8,
              onPress: () {
                isButtonActive == true
                    ? NavRouter.push(context, AgentToCNICScreen())
                    : customToast('Please fill the form correctly');
              },
              primaryColor: isButtonActive == false
                  ? AppColors.whiteColor
                  : AppColors.blueDark,
              title: 'Enter Amount',
              textColor: isButtonActive == false
                  ? AppColors.blueDark
                  : AppColors.whiteColor,
              alignment: MainAxisAlignment.center,
            ),
          )
        ],
      ),
    );
  }
}
