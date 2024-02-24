import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/constants/device_size.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/bill_payment/review_bill_payment_screen/review_bill_service_tile.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_otp_black_bg/enter_otp_black_bg.dart';
import 'package:flutter/material.dart';

import '../../../../global_widgets/custom_toast.dart';
import '../../../../utils/nav_router.dart';

class ReviewBillPaymentScreen extends StatefulWidget {
  ReviewBillPaymentScreen({Key? key}) : super(key: key);

  @override
  State<ReviewBillPaymentScreen> createState() =>
      _ReviewBillPaymentScreenState();
}

class _ReviewBillPaymentScreenState extends State<ReviewBillPaymentScreen> {
  final billPaymentController = TextEditingController();

  bool isButtonActive = false;
  isButtonEnabled() {
    billPaymentController.addListener(() {
      final isButtonActive = billPaymentController.text.length >= 3;
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
    DeviceSizeConfig().init(context);
    return BlackBgWidget(
      horizontal: 0.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            CustomText(
              horizontalPadding: 30.0,
              verticalPadding: 2.0,
              text: 'Review Bill Payment',
              fontSize: 32,
            ),
            CustomText(
              horizontalPadding: 30.0,
              verticalPadding: 7.0,
              text: 'Enter bill amount ',
              fontSize: 16,
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: CustomWhiteBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WhiteBoxInputField(
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
                      controller: billPaymentController,
                      hintText: 'Rs.1,040',
                      hintTextColor: AppColors.lightGreyColor,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomText(
                        text: "Pay Amount",
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomText(
                text: 'To',
                fontSize: 14,
              ),
            ),
            ReviewBillsServiceTile(
              title: 'K-Electric',
              subtitle: '12345678935476',
              textButton: 'Edit',
              image: AssetsPath.ELECTRIC_LOGO,
            ),
            ReviewBillsServiceTile(
              title: 'Due Date',
              subtitle: '06 | December | 2019',
              textButton: null,
              image: AssetsPath.dueDate,
            ),
            ReviewBillsServiceTile(
              title: 'payable after due date',
              subtitle: 'Rs.1,125.00',
              textButton: null,
              image: AssetsPath.afterDate,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: CustomText(
                text: 'Form',
                fontSize: 14,
              ),
            ),
            Container(
              height: 250,
              margin: EdgeInsets.only(top: 1, bottom: 3), // ***
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGreyColor,
                    blurRadius: .5,
                    spreadRadius: .05,
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(AssetsPath.reviewBillProfile),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'My Fintech Account',
                                fontSize: 18,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                text: '03XXXXXXXXX',
                                fontSize: 16,
                                color: AppColors.darkGreyColor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Balance; Rs . 5000000',
                            fontSize: 18,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(AssetsPath.phoneVerified),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: CustomText(
                          text: 'Pay Via another',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
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
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                  width: MediaQuery.of(context).size.width * .8,
                  height: 50,
                  onPress: () {
                    isButtonActive == true
                        ? NavRouter.push(context, EnterOTPBlackScreen())
                        : customToast('Please fill the form correctly');
                  },
                  primaryColor: isButtonActive == false
                      ? AppColors.whiteColor
                      : AppColors.blueDark,
                  title: 'Confirm Transaction',
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
      ),
    );
  }
}
