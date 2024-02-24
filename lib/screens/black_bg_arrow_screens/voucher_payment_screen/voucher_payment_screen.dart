import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_card_details/card_tile.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../../constants/assets_path.dart';
import '../enter_otp_black_bg/enter_otp_black_bg.dart';

class VoucherPaymentScreen extends StatefulWidget {
  const VoucherPaymentScreen({Key? key}) : super(key: key);

  @override
  State<VoucherPaymentScreen> createState() => _VoucherPaymentScreenState();
}

class _VoucherPaymentScreenState extends State<VoucherPaymentScreen> {
  var billAmountController = TextEditingController();
  var feeController = TextEditingController();
  var billCompanyController = TextEditingController();
  var voucherNumberController = TextEditingController();
  var billingNumberController = TextEditingController();
  var billingDateController = TextEditingController();

  bool valuefirst = false;
  bool valuesecond = false;

  @override
  void initState() {
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
              verticalPadding: 10,
              horizontalPadding: 30,
              text: 'Voucher Payments',
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
                  horizontalPadding: 34,
                  text: 'Voucher Payments in FinTech Method',
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
              readOnly: true,
              onChanged: (value) {},
              hintText: 'Rs . 2,158.00',
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
              readOnly: true,
              onChanged: (value) {},
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
              readOnly: true,
              onChanged: (value) {},
              hintText: 'Voucher Payment ',
              textController: billCompanyController,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Voucher Number',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              readOnly: true,
              onChanged: (value) {},
              textAlign: TextAlign.left,
              hintText: '190110018263',
              textController: voucherNumberController,
              color: AppColors.blackColor,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CustomText(
                horizontalPadding: 30,
                text: 'Billing Date',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blueDark,
              ),
            ),
            CardInputField(
              readOnly: true,
              onChanged: (value) {},
              textAlign: TextAlign.left,
              hintText: '06 | December | 2019',
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
                    NavRouter.push(context, EnterOTPBlackScreen());
                  },
                  primaryColor: AppColors.blueDark,
                  title: 'Continue',
                  textColor: AppColors.whiteColor,
                  fontSize: 18,
                  alignment: MainAxisAlignment.spaceBetween,
                  image: AssetsPath.IC_white_line_bottom_button),
            )
          ],
        ),
      ),
    );
  }
}
