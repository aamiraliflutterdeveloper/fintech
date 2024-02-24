import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/app_data.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/core/models/transaction_history_model.dart';
import 'package:fintech_app/core/models/user_model.dart';
import 'package:fintech_app/global_widgets/custom_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/global_widgets/transaction_history_card.dart';
import 'package:fintech_app/screens/login_with_pin_screen/login_with_pin_screen.dart';
import 'package:fintech_app/screens/transaction/transaction_history_screen.dart';
import 'package:fintech_app/widgets/common_widgets/dot_indicator.dart';
import 'package:fintech_app/widgets/home_widgets/my_fintech_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_dialogbox.dart';
import '../utils/nav_router.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? userModel;
  final bool? guest;
  final String? pin;
  const HomeScreen({Key? key, required this.userModel, this.guest, this.pin})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedLatestUpdateCardsIndex = 0;
  bool isLoggedIn = false;
  bool isBalanceShowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'),
                  ),
                  SizedBox(width: 10),
                  widget.pin == null
                      ? Text(
                          widget.userModel == null
                              ? ''
                              : '${widget.userModel!.fullName}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        )
                      : Container(
                          width: 250,
                          child: Text(
                            'Welcome, ${widget.userModel!.fullName}',
                            style: TextStyle(
                                color: AppColors.blueDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        )
                ],
              ),
            ),
            isLoggedIn == true
                ? SizedBox(height: 14)
                : SizedBox(
                    height: 0,
                  ),
            widget.pin != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'What I have',
                          style: TextStyle(
                              color: AppColors.blueDark,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AssetsPath.IC_OPENED_LOCK),
                            SizedBox(width: 4),
                            Text(
                              'PKR',
                              style: TextStyle(
                                  color: AppColors.blueDark,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  ),
            widget.pin != null
                ? Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: AppColors.blueDark)),
                          color: isBalanceShowed
                              ? Colors.white
                              : Color(0xffF1F1F1),
                        ),
                        height: 180,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isBalanceShowed = true;
                            });
                          },
                          child: isBalanceShowed
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '1065500.80',
                                      style: TextStyle(
                                        color: AppColors.blueDark,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Available Balance',
                                      style: TextStyle(
                                        color: AppColors.blueDark,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Show Balance',
                                      style: TextStyle(
                                        color: AppColors.blueDark,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: AppColors.blueDark,
                                    )
                                  ],
                                ),
                        ),
                      ),
                      isBalanceShowed
                          ? Positioned(
                              right: 10,
                              bottom: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isBalanceShowed = false;
                                  });
                                },
                                child: Text(
                                  'Hide Balance',
                                  style: TextStyle(
                                    color: AppColors.blueDark,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () async {
                                print(widget.guest);
                                print("this is value");
                                if (widget.guest == true) {
                                  customToast('Please Create Account');
                                }
                                if (widget.guest == null) {
                                  NavRouter.push(
                                      context,
                                      LoginWithPinScreen(
                                        userModel: widget.userModel,
                                      )).then((matched) {
                                    setState(() {
                                      isLoggedIn = matched;
                                    });
                                  });
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: AppColors.blueDark,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(width: 8),
                            SvgPicture.asset(
                              AssetsPath.IC_ARROW_FORWARD,
                              height: 14,
                              width: 14,
                            )
                          ],
                        ),
                        Text(
                          'to Manage Account',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14),
                  CustomText(
                    text: 'My Fintech',
                    color: AppColors.blueDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  SizedBox(height: 14),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          4,
                          (index) => GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    AppDialogBox.showTransferDialogBox(context);
                                  }
                                  if (index == 1) {
                                    AppDialogBox.showDepositDialogBox(context);
                                  }
                                  if (index == 2) {
                                    AppDialogBox.showPayBillsDialogBox(context);
                                  }
                                  if (index == 3) {
                                    AppDialogBox.showPaymentsDialogBox(context);
                                  }
                                },
                                child: MyFintechCard(
                                  title: myFintechDataList[index].title,
                                  iconPath: myFintechDataList[index].path,
                                ),
                              ))),
                  SizedBox(height: 14),
                  GestureDetector(
                    onTap: () {
                      AppDialogBox.showTransactionDialogBox(context);
                    },
                    child: MyFintechCard(
                      title: myFintechDataList[4].title,
                      iconPath: myFintechDataList[4].path,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  CustomText(
                    text: 'Latest Updates',
                    color: AppColors.blueDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 160,
                    child: PageView(
                      onPageChanged: (int page) {
                        setState(() {
                          selectedLatestUpdateCardsIndex = page;
                        });
                      },
                      children: [
                        Container(
                          child: Image.asset(AssetsPath.Slider1),
                        ),
                        Container(
                          child: Image.asset(AssetsPath.Slider2),
                        ),
                        Container(
                          child: Image.asset(AssetsPath.Slider3),
                        ),
                        Container(
                          child: Image.asset(AssetsPath.Slider4),
                        ),
                      ],
                    ),
                  ),
                  BuildDotIndicators(
                      selectedIndex: selectedLatestUpdateCardsIndex),
                  SizedBox(height: 18),
                  CustomText(
                    text: 'Latest Transactions',
                    color: AppColors.blueDark,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                  SizedBox(height: 4),
                  ...List.generate(
                    3,
                    (index) => TransactionCard(
                      cancel: () {
                        print("pressed");
                        transaction_history_data.remove(index);
                        setState(() {});
                      },
                      date: transaction_history_data[index].date,
                      amount: transaction_history_data[index].amount,
                      phone: transaction_history_data[index].phone,
                      isDebit: transaction_history_data[index].isDebit,
                      providerName:
                          transaction_history_data[index].providerName,
                    ),
                  ),
                  SizedBox(height: 18),
                  Container(
                      width: double.infinity,
                      height: 56,
                      child: CustomButton(
                        isOutlined: true,
                        textColor: AppColors.blueDark,
                        title: 'View Statement',
                        onPressed: () {
                          NavRouter.push(context, TransactionHistoryScreen());
                        },
                      )),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.space);

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space);
  }
}
