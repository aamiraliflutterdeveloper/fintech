import 'package:fintech_app/screens/transaction/debit_screens/debit_card.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../constants/app_colors.dart';
import '../../../core/models/transaction_history_model.dart';
import '../../../global_widgets/custom_text.dart';
import '../../../utils/behavior.dart';

class DebitScreen extends StatelessWidget {
  DebitScreen({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Debit": 6.5,
    "Credit": 3.5,
  };
  final colorList = <Color>[
    AppColors.blueDark,
    AppColors.mediumGreyColor,
  ];

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(seconds: 1),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3 > 330
          ? 300
          : MediaQuery.of(context).size.width / 3,
      colorList: colorList,
      initialAngleInDegree: 0 - 40,
      chartType: ChartType.ring,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: false,
        legendShape: BoxShape.circle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: false,
        showChartValues: false,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
      ),
      ringStrokeWidth: 24,
      emptyColor: Colors.grey,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
    );
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Zayn Oskar',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: '03XXXXXXXXX',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              chart,
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColors.blueDark),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        CustomText(
                          text: 'PKR',
                          fontSize: 14,
                          color: AppColors.blueDark,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Total Debit',
                        fontSize: 14,
                        color: AppColors.blueDark,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      CustomText(
                        text: '900000.00',
                        fontSize: 14,
                        color: AppColors.blueDark,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(
                  transaction_history_data.length,
                  (index) => DebitCard(
                    date: transaction_history_data[index].date,
                    amount: transaction_history_data[index].amount,
                    phone: transaction_history_data[index].phone,
                    isDebit: transaction_history_data[index].isDebit,
                    providerName: transaction_history_data[index].providerName,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
