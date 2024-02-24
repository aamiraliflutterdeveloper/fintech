import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_amount_for_bank_account.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/custom_elevated_button.dart';
import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';

class EnterBankAccount extends StatefulWidget {
  EnterBankAccount({Key? key}) : super(key: key);

  @override
  State<EnterBankAccount> createState() => _EnterBankAccountState();
}

class _EnterBankAccountState extends State<EnterBankAccount> {
  final bankAccountController = TextEditingController();

  bool isButtonActive = false;

  @override
  void initState() {
    isButtonEnabled();
    super.initState();
  }

  isButtonEnabled() {
    bankAccountController.addListener(() {
      final isButtonActive = bankAccountController.text.length >= 13;
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
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: CustomText(
                  horizontalPadding: 30,
                  verticalPadding: 2,
                  text: 'Enter your Bank Account',
                  fontSize: 32,
                ),
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Enter Number or search recipient',
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
                        controller: bankAccountController,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomText(
                          text:
                              "Don't\ use same or sequential characters while creating your MPIN",
                          fontSize: 14,
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
                insertText(myText, bankAccountController);
                setState(() {});
              },
              onBackspace: () {
                backspace(bankAccountController);
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
                      ? NavRouter.push(
                          context, EnterAmountForBankAccountScreen())
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
