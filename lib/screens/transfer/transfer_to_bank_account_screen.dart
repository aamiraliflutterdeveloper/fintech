import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/tranfer_bank_widget.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../core/models/transfer_bank_model.dart';
import '../../global_widgets/custom_text.dart';
import '../black_bg_arrow_screens/enter_bank_account/enter_bank_account.dart';

class TransferToBankAccountScreen extends StatelessWidget {
  final bool isFromDeposit;
  const TransferToBankAccountScreen({Key? key, this.isFromDeposit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlackBgWidget(
      child: Container(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CustomText(
                text: isFromDeposit
                    ? 'Deposit Money Via Bank'
                    : 'Transfer to Bank Account',
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'search or select your Bank',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  border: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderRadius: BorderRadius.all(Radius.circular(90.0)),
                    borderSide: BorderSide.none,
                    //borderSide: const BorderSide(),
                  ),
                  fillColor: Color(0xFFF1F1F1),
                  filled: true,
                  hintText: 'Search bank',
                  suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'All Banks',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 15),
                    itemCount: transfer_to_bank_data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          NavRouter.push(context, EnterBankAccount());
                        },
                        child: TransferBankWidget(
                          name: transfer_to_bank_data[index].name!,
                          image: transfer_to_bank_data[index].image!,
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
