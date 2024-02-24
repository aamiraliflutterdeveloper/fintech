import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../core/models/transaction_history_model.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/home_bg_widget.dart';
import '../../global_widgets/transaction_history_card.dart';
import 'credit_screen/credit_screen.dart';
import 'debit_screens/debits_screen.dart';

class TransactionHistoryScreen extends StatefulWidget {
  TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  PageController? _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Transaction History'),
          backgroundColor: AppColors.blueDark,
          actions: [
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              offset: Offset(0, 50),
              initialValue: 2,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: SvgImage(
                    path: AssetsPath.IC_DOWNLOAD,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              itemBuilder: (context) {
                return List.generate(2, (index) {
                  return PopupMenuItem(
                    padding: EdgeInsets.zero,
                    value: index,
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () async {},
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(left: 14, top: 0, bottom: 0),
                          leading: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: SvgImage(
                              path: index == 0
                                  ? AssetsPath.IC_PDF
                                  : AssetsPath.IC_CSV,
                              color: AppColors.blueDark,
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              index == 0 ? 'PDF' : 'CSV',
                              style: TextStyle(
                                  fontSize: 16, color: AppColors.blueDark),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          ],
        ),
        body: HomeBgWidget(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                _menuBar(context),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    onPageChanged: (int i) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        activePageIndex = i;
                      });
                    },
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: AllTransactionHistory(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: DebitScreen(),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: CreditScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuBar(BuildContext context) {
    const double borderRadius = 20.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 55.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _allButtonPressed,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 0)
                      ? const BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius)),
                        )
                      : BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius)),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                  child: Text(
                    "All",
                    style: (activePageIndex == 0)
                        ? TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _debitsButtonPressed,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 1)
                      ? const BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius)),
                        )
                      : BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius)),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                  child: Text(
                    "Debits",
                    style: (activePageIndex == 1)
                        ? TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                        : TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                onTap: _onCreditButtonPressed,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  alignment: Alignment.center,
                  decoration: (activePageIndex == 2)
                      ? const BoxDecoration(
                          color: AppColors.blackColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius)),
                        )
                      : BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(borderRadius)),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                  child: Text(
                    "Credits",
                    style: (activePageIndex == 2)
                        ? TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _allButtonPressed() {
    _pageController!.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _debitsButtonPressed() {
    _pageController!.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onCreditButtonPressed() {
    _pageController!.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}

class AllTransactionHistory extends StatelessWidget {
  AllTransactionHistory({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Debit": 6.5,
    "Credit": 3.5,
  };
  final colorList = <Color>[
    AppColors.blueDark,
    AppColors.mediumBlueColor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'Total Debit',
                          fontSize: 14,
                          color: AppColors.blueDark,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
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
                            SizedBox(
                              height: 2,
                            ),
                            CustomText(
                              text: '160000.00',
                              fontSize: 14,
                              color: AppColors.blueDark,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    height: 24,
                    width: 2,
                    color: AppColors.blueDark,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(
                          text: 'Total Credits',
                          fontSize: 14,
                          color: AppColors.mediumBlueColor,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.mediumBlueColor),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                CustomText(
                                  text: 'PKR',
                                  fontSize: 14,
                                  color: AppColors.mediumBlueColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            CustomText(
                              text: '900000.00',
                              fontSize: 14,
                              color: AppColors.mediumBlueColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(
                  transaction_history_data.length,
                  (index) => TransactionCard(
                    cancel: () {},
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
