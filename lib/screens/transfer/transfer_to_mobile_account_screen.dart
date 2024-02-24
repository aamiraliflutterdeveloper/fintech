import 'package:fintech_app/utils/behavior.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_amount_screen/enter_amount_screen.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

import '../../core/models/transfer_mobile_model.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/transfer_mobile_widget.dart';

class TransferToMobileAccountScreen extends StatelessWidget {
  const TransferToMobileAccountScreen({Key? key}) : super(key: key);

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
                text: 'Transfer to Mobile Account',
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Enter Number or search recipient',
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
                  hintText: 'Search name or mobile number',
                  suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 10,
            ),
            CustomText(
              text: 'Your Phone Contacts',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 15),
                    itemCount: transfer_to_data.length,
                    itemBuilder: (context, index) {
                      return TransferMobileWidget(
                        onPressed: () {
                          NavRouter.push(context, EnterAmountScreen());
                        },
                        name: transfer_to_data[index].name!,
                        mobile: transfer_to_data[index].mobile!,
                        isAvailable: transfer_to_data[index].isAvailable,
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
