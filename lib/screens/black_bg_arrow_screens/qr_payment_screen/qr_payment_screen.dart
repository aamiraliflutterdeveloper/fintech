import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../global_widgets/custom_elevated_button.dart';
import '../../../global_widgets/custom_toast.dart';
import '../../../global_widgets/custom_white_box.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_with_thumb.dart';
import '../../../global_widgets/white_box_input_field.dart';

class QRPaymentScreen extends StatefulWidget {
  QRPaymentScreen({Key? key}) : super(key: key);

  @override
  State<QRPaymentScreen> createState() => _QRPaymentScreenState();
}

class _QRPaymentScreenState extends State<QRPaymentScreen> {
  late TextEditingController qrPaymentController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    qrPaymentController = TextEditingController();
    isButtonEnabled();
    super.initState();
  }

  isButtonEnabled() {
    qrPaymentController.addListener(() {
      final isButtonActive = qrPaymentController.text.length >= 8;
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                text: 'QR Payment',
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Enter Till ID',
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
                        controller: qrPaymentController,
                        hintText: '00000000',
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
                        text: 'Enter 8 - digit Till ID',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // CustomKeyboardPayment(),
          Expanded(
            child: CustomKeyboardWithThumb(
              onTextInput: (myText) {
                insertText(myText, qrPaymentController);
                setState(() {});
              },
              onBackspace: () {
                backspace(qrPaymentController);
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
                      ? Navigator.of(context).popUntil((route) => route.isFirst)
                      : customToast('Please fill the form correctly');
                },
                primaryColor: isButtonActive == false
                    ? AppColors.whiteColor
                    : AppColors.blueDark,
                title: 'Enter Amount',
                textColor: isButtonActive == false
                    ? AppColors.blueDark
                    : AppColors.whiteColor,
                fontSize: 18,
                alignment: MainAxisAlignment.center,
              )),
        ],
      ),
    );
  }
}
