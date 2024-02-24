import 'package:fintech_app/core/models/transaction_history_model.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:flutter/material.dart';

import '../../global_widgets/custom_text.dart';
import '../../global_widgets/transaction_history_card.dart';

class PendingTransactionScreen extends StatefulWidget {
  PendingTransactionScreen({Key? key}) : super(key: key);

  @override
  State<PendingTransactionScreen> createState() =>
      _PendingTransactionScreenState();
}

class _PendingTransactionScreenState extends State<PendingTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: CustomText(
              text: 'Pending Transactions',
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          CustomText(
            text: 'From Account',
            fontSize: 14,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    transaction_history_data.length,
                    (index) => TransactionCard(
                      cancel: () {
                        print("pressed");
                        transaction_history_data.removeAt(index);
                        setState(() {});
                      },
                      isPending: true,
                      date: transaction_history_data[index].date,
                      amount: transaction_history_data[index].amount,
                      phone: transaction_history_data[index].phone,
                      isDebit: transaction_history_data[index].isDebit,
                      providerName:
                          transaction_history_data[index].providerName,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
