import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/keyboard_with_point/keyboard_with_point.dart';
import 'package:fintech_app/global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/bill_payment/review_bill_payment_screen/review_bill_payment_screen.dart';
import 'package:flutter/material.dart';

import '../../../../global_widgets/custom_toast.dart';
import '../../../../global_widgets/white_box_input_field.dart';
import '../../../../utils/nav_router.dart';

class payBillsNumberScreen extends StatefulWidget {
  payBillsNumberScreen({Key? key}) : super(key: key);

  @override
  State<payBillsNumberScreen> createState() => _payBillsNumberScreenState();
}

class _payBillsNumberScreenState extends State<payBillsNumberScreen> {
  final refNumberController = TextEditingController();

  bool isButtonActive = false;
  isButtonEnabled() {
    refNumberController.addListener(() {
      final isButtonActive = refNumberController.text.length >= 14;
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
                verticalPadding: 10,
                text: 'Pay Bills',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Enter bill reference Number',
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
                        controller: refNumberController,
                        hintText: 'Consumer Reference Number',
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
                        height: 30,
                      ),
                      CustomText(
                        horizontalPadding: 30.0,
                        text: 'Enter 14 digit K-ELECTRIC REFERENCE number ',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: CustomKeyboardWithPoint(
              onTextInput: (myText) {
                insertText(myText, refNumberController);
                setState(() {});
              },
              onBackspace: () {
                backspace(refNumberController);
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
                      ? NavRouter.push(context, ReviewBillPaymentScreen())
                      : customToast('Please fill the form correctly');
                },
                primaryColor: isButtonActive == false
                    ? AppColors.whiteColor
                    : AppColors.blueDark,
                title: 'Fetch bill',
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
