import 'package:fintech_app/screens/black_bg_arrow_screens/enter_amount_for_credit_debit.dart';
import 'package:fintech_app/screens/transfer/prepaid_mobile_load_screen.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/assets_path.dart';
import '../global_widgets/custom_text.dart';
import '../global_widgets/money_transfer_card.dart';
import '../screens/black_bg_arrow_screens/bill_payment/pay_bills_services_screen/pay_bills_services_screen.dart';
import '../screens/black_bg_arrow_screens/enter_amount_for_agent_to_cnic.dart';
import '../screens/black_bg_arrow_screens/enter_amount_screen/enter_amount_screen.dart';
import '../screens/black_bg_arrow_screens/schedule_transactions_screen/schedule_transactions_screen.dart';
import '../screens/black_bg_arrow_screens/token_payment_screen/token_payment_screen.dart';
import '../screens/black_bg_arrow_screens/transfer_to_cnic/transfer_to_cnic.dart';
import '../screens/black_bg_arrow_screens/voucher_payment_screen/voucher_payment_screen.dart';
import '../screens/transaction/pending_transactions_screen.dart';
import '../screens/transfer/transfer_to_bank_account_screen.dart';
import '../screens/transfer/transfer_to_mobile_account_screen.dart';
import 'nav_router.dart';

class AppDialogBox {
  static showTransferDialogBox(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: 'Money Transfer',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(
                              context, TransferToMobileAccountScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'FinTech Transfer',
                            icon: AssetsPath.IC_APP_LOGO),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(
                              context, TransferToBankAccountScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'Bank Transfer', icon: AssetsPath.IC_BANK),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, TransferToCNIC());
                        },
                        child: MoneyTransferCard(
                          name: 'CNIC Transfer',
                          icon: AssetsPath.IC_ID_CARD,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static showDepositDialogBox(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: 'Deposits Money',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context,
                              TransferToBankAccountScreen(isFromDeposit: true));
                        },
                        child: MoneyTransferCard(
                            name: 'Banks Deposit',
                            icon: AssetsPath.IC_DEPOSIT_MONEY_BANK),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(
                              context, EnterAmountForCreditDeposit());
                        },
                        child: MoneyTransferCard(
                            name: 'Credit/Debit\nCard deposit',
                            icon: AssetsPath.IC_DEPOSIT_MONEY_CARD),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, EnterAmountForAgentToCnic());
                        },
                        child: MoneyTransferCard(
                          name: 'Deposit through agent ',
                          icon: AssetsPath.IC_DEPOSIT_MONEY_AGENT,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static showPayBillsDialogBox(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: 'Pay Bills',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, PayBillsServicesScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'Electricity',
                            icon: AssetsPath.IC_ELECTRICITY),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, EnterAmountScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'Gas', icon: AssetsPath.IC_GAS),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, EnterAmountScreen());
                        },
                        child: MoneyTransferCard(
                          name: 'Water',
                          icon: AssetsPath.IC_WATER,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(
                              context, TransferToBankAccountScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'Internet', icon: AssetsPath.IC_INTERNET),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, EnterAmountScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'TelePhone', icon: AssetsPath.IC_TELEPHONE),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, PrePaidMobileLoadScreen());
                        },
                        child: MoneyTransferCard(
                          name: 'Mobile',
                          icon: AssetsPath.IC_MOBILE_PAY,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static showPaymentsDialogBox(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: 'Payments',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, VoucherPaymentScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'Voucher\nPayments',
                            icon: AssetsPath.IC_CHECKED_LIST),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, TokenPaymentScreen());
                        },
                        child: MoneyTransferCard(
                          name: 'Token\nPayment',
                          icon: AssetsPath.IC_TIMER,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  static showTransactionDialogBox(BuildContext context) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      barrierColor: Colors.black.withOpacity(.8),
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(
                    text: 'Transactions ',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueDark,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, ScheduleTransactionScreen());
                        },
                        child: MoneyTransferCard(
                            name: 'Schedule\nTransactions ',
                            icon: AssetsPath.IC_CHECKED_LIST),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          NavRouter.push(context, PendingTransactionScreen());
                        },
                        child: MoneyTransferCard(
                          name: 'Pending\nTransactions',
                          icon: AssetsPath.IC_TIMER,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
