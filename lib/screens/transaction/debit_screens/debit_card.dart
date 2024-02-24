import 'package:fintech_app/screens/black_bg_arrow_screens/schedule_transactions_screen/schedule_transactions_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../global_widgets/custom_text.dart';

class DebitCard extends StatelessWidget {
  final String date;
  final String amount;
  final bool? isDebit;
  final String phone;
  final String providerName;
  final bool isPending;
  const DebitCard({
    Key? key,
    required this.date,
    required this.amount,
    this.isDebit = false,
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
        color: isDebit!
            ? Colors.white
            : isPending
                ? AppColors.mediumBlueColor
                : AppColors.mediumBlueColor,
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
                        style:
                            TextStyle(color: AppColors.blueDark, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Feb 2022',
                            style: TextStyle(
                                color: AppColors.blueDark, fontSize: 14),
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
                              color: AppColors.blueDark),
                          CustomText(
                              text: '$amount ',
                              fontSize: 18,
                              color: AppColors.blueDark),
                          CustomText(
                              text: isDebit! ? 'Debits' : 'Credits',
                              fontSize: 18,
                              color: AppColors.blueDark),
                        ],
                      ),
                      CustomText(
                        text: phone,
                        fontSize: 18,
                        color: AppColors.blueDark,
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
                      color: AppColors.blueDark),
                  isPending
                      ? Row(
                          children: [
                            Container(
                              height: 24,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.blueDark,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScheduleTransactionScreen()));
                                },
                                child: CustomText(
                                    text: 'Reschedule',
                                    fontSize: 8,
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              height: 24,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.blueVariant,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {},
                                child: CustomText(
                                    text: 'Cancel',
                                    fontSize: 8,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      : SizedBox()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
