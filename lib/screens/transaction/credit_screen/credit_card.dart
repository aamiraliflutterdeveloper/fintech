import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../global_widgets/custom_text.dart';

class CreditCard extends StatelessWidget {
  final String date;
  final String amount;
  final bool? isCredit;
  final String phone;
  final String providerName;
  final bool isPending;
  const CreditCard({
    Key? key,
    required this.date,
    required this.amount,
    this.isCredit = false,
    this.isPending = false,
    required this.phone,
    required this.providerName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      height: 130,
      width: double.infinity,
      child: Card(
        color: isCredit! ? Colors.white : AppColors.blueDark,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                        text: '$date\n',
                        style: TextStyle(
                            color: AppColors.mediumBlueColor, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Feb 2022',
                            style: TextStyle(
                                color: AppColors.mediumBlueColor, fontSize: 14),
                          )
                        ]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: 'PKR ',
                              fontSize: 18,
                              color: AppColors.mediumBlueColor),
                          CustomText(
                              text: '$amount ',
                              fontSize: 18,
                              color: AppColors.mediumBlueColor),
                          CustomText(
                              text: isCredit! ? 'Debits' : 'Credits',
                              fontSize: 18,
                              color: AppColors.mediumBlueColor),
                        ],
                      ),
                      CustomText(
                        text: phone,
                        fontSize: 18,
                        color: AppColors.mediumBlueColor,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: providerName,
                      fontSize: 14,
                      color: AppColors.mediumBlueColor),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
