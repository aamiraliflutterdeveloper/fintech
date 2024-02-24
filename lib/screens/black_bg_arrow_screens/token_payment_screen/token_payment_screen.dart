import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_card_details/card_tile.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/custom_toast.dart';
import '../../../utils/nav_router.dart';
import '../enter_otp_black_bg/enter_otp_black_bg.dart';

class TokenPaymentScreen extends StatefulWidget {
  const TokenPaymentScreen({Key? key}) : super(key: key);

  @override
  State<TokenPaymentScreen> createState() => _TokenPaymentScreenState();
}

class _TokenPaymentScreenState extends State<TokenPaymentScreen> {
  var billAmountController = TextEditingController();
  var feeController = TextEditingController();
  var billCompanyController = TextEditingController();
  var voucherNumberController = TextEditingController();
  var billingDateController = TextEditingController();

  bool valuefirst = false;
  bool valuesecond = false;
  bool isEnable = false;

  void validateButton() {
    bool isValid = true;
    isValid = billAmountController.text.isNotEmpty &&
        feeController.text.isNotEmpty &&
        billCompanyController.text.isNotEmpty &&
        voucherNumberController.text.isNotEmpty &&
        billingDateController.text.isNotEmpty;

    setState(() {
      isEnable = isValid;
    });
  }

  @override
  void initState() {
    validateButton();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      horizontal: 0.0,
      resizeToAvoidBottomInset: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            CustomText(
              horizontalPadding: 30,
              verticalPadding: 10,
              text: 'Token Payment',
              fontSize: 32,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.greyLastColor,
                    width: 1.5,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: CustomText(
                  horizontalPadding: 30,
                  text: ' Token Payments in FinTech Method',
                  fontSize: 16,
                  color: AppColors.greyLastColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Bill Amount',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              onChanged: (value) {
                validateButton();
              },
              hintText: 'Rs . 500.00',
              textController: billAmountController,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Fee',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              onChanged: (value) {
                validateButton();
              },
              hintText: 'Rs . 0.00',
              textController: feeController,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Bill Company ',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              onChanged: (value) {
                validateButton();
              },
              hintText: 'Voucher Payment ',
              textController: billCompanyController,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Transaction Identifier',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              onChanged: (value) {
                validateButton();
              },
              textAlign: TextAlign.left,
              hintText: '004515569496',
              textController: voucherNumberController,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Consumer reference number',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              onChanged: (value) {
                validateButton();
              },
              textAlign: TextAlign.left,
              hintText: '190110018263',
              textController: billingDateController,
              color: AppColors.blackColor,
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
                  title: 'Continue',
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
