import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_card_details/card_tile.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';
import '../../../global_widgets/custom_elevated_button.dart';
import '../../../global_widgets/custom_toast.dart';
import '../../../utils/nav_router.dart';
import '../enter_otp_black_bg/enter_otp_black_bg.dart';

class EnterCardDetails extends StatefulWidget {
  const EnterCardDetails({Key? key}) : super(key: key);

  @override
  State<EnterCardDetails> createState() => _EnterCardDetailsState();
}

class _EnterCardDetailsState extends State<EnterCardDetails> {
  var cardNumberController = TextEditingController();
  var mobileNumberController = TextEditingController();
  var ccvController = TextEditingController();
  var cardExpiryController = TextEditingController();

  bool isEnable = false;

  bool valuefirst = false;
  bool valuesecond = false;

  void validateButton() {
    bool isValid = true;
    isValid = cardNumberController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty &&
        cardExpiryController.text.isNotEmpty &&
        ccvController.text.isNotEmpty;

    setState(() {
      isEnable = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      resizeToAvoidBottomInset: true,
      horizontal: 0.0,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: CustomText(
                    horizontalPadding: 30,
                    verticalPadding: 10,
                    text: 'Enter Your Card Details ',
                    fontSize: 32,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * .4,
                          height: 40,
                          onPress: () {},
                          title: 'Credit Card',
                          textColor: AppColors.whiteColor,
                          fontSize: 12,
                          alignment: MainAxisAlignment.center,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: CustomElevatedButton(
                          width: MediaQuery.of(context).size.width * .4,
                          primaryColor: AppColors.whiteColor,
                          borderColor: AppColors.whiteColor,
                          height: 40,
                          onPress: () {},
                          title: 'Debit Card',
                          textColor: AppColors.blackColor,
                          fontSize: 12,
                          alignment: MainAxisAlignment.center,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: CustomText(
                    horizontalPadding: 30,
                    verticalPadding: 10,
                    text: 'Card Number',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CardInputField(
                  onChanged: (value) {
                    validateButton();
                  },
                  hintText: '123XXXXXXXXXXXXXXXXX',
                  textController: cardNumberController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: CustomText(
                    horizontalPadding: 30,
                    text: 'Mobile Number',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CardInputField(
                  onChanged: (value) {
                    validateButton();
                  },
                  hintText: '03XXXXXXXX',
                  textController: mobileNumberController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: CustomText(
                    horizontalPadding: 30,
                    text: 'CVV',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CardInputField(
                  onChanged: (value) {
                    validateButton();
                  },
                  hintText: 'xxx',
                  textController: ccvController,
                  icon: Icon(
                    Icons.visibility,
                    color: AppColors.blueDark,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: CustomText(
                    horizontalPadding: 30,
                    text: 'Card Expiry',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CardInputField(
                  onChanged: (value) {
                    validateButton();
                  },
                  textAlign: TextAlign.center,
                  hintText: '06 | December | 2019',
                  textController: cardExpiryController,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: this.valuesecond,
                        onChanged: (value) {
                          setState(() {
                            this.valuesecond = value!;
                          });
                        },
                      ),
                      CustomText(
                        text: 'Securely save My card information ',
                        fontSize: 16,
                        color: AppColors.greyLastColor,
                      )
                    ],
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
                    isEnable == true
                        ? NavRouter.push(context, EnterOTPBlackScreen())
                        : customToast('Please fill the form correctly');
                  },
                  primaryColor: isEnable == false
                      ? AppColors.whiteColor
                      : AppColors.blueDark,
                  title: 'Pay',
                  textColor: isEnable == false
                      ? AppColors.blueDark
                      : AppColors.whiteColor,
                  fontSize: 18,
                  alignment: MainAxisAlignment.spaceBetween,
                  image: isEnable == false
                      ? AssetsPath.IC_green_line_bottom_button
                      : AssetsPath.IC_white_line_bottom_button),
            )
          ],
        ),
      ),
    );
  }
}
