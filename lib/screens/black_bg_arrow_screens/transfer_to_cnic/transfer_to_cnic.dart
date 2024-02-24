import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_amount_screen/enter_amount_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';
import '../../../global_widgets/custom_white_box.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';
import '../../../global_widgets/white_box_input_field.dart';
import '../../../utils/nav_router.dart';

class TransferToCNIC extends StatefulWidget {
  TransferToCNIC({Key? key}) : super(key: key);

  @override
  State<TransferToCNIC> createState() => _TransferToCNICState();
}

class _TransferToCNICState extends State<TransferToCNIC> {
  final cnicController = TextEditingController();

  bool isButtonActive = false;
  isButtonEnabled() {
    cnicController.addListener(() {
      final isButtonActive = cnicController.text.length >= 13;
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
                text: 'Transfer to CNIC',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Please Enter Your CNIC',
                fontSize: 16,
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
                        controller: cnicController,
                        hintText: 'XXXXX-XXXXXXX-X',
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
                        text: 'CNIC will be 13 digits',
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
                insertText(myText, cnicController);
                setState(() {});
              },
              onBackspace: () {
                backspace(cnicController);
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
                          context,
                          EnterAmountScreen(
                            isTransferCnic: true,
                          ))
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
