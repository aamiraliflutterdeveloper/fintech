import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_amount_for_mobile_account.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:flutter/material.dart';

import '../../core/models/transfer_mobile_model.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/mobile_load_provider_widget.dart';
import '../../global_widgets/transfer_mobile_widget.dart';
import '../../utils/nav_router.dart';

class PrePaidMobileLoadScreen extends StatelessWidget {
  const PrePaidMobileLoadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlackBgWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: CustomText(
              text: 'Prepaid Mobile Load',
              fontSize: 26,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MobileLoadProviderWidget(
                  name: 'Jazz',
                  icon: AssetsPath.IC_JAZZ,
                ),
                MobileLoadProviderWidget(
                  name: 'Zong',
                  icon: AssetsPath.IC_ZONG,
                ),
                MobileLoadProviderWidget(
                  name: 'Telenor',
                  icon: AssetsPath.IC_TELENOR,
                ),
                MobileLoadProviderWidget(
                  name: 'Uphone',
                  icon: AssetsPath.IC_UFONE,
                ),
              ],
            ),
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
                  itemCount: transfer_to_data.length,
                  itemBuilder: (context, index) {
                    return TransferMobileWidget(
                      onPressed: () {
                        print(
                            'Available ${transfer_to_data[index].isAvailable}');

                        NavRouter.push(
                            context, EnterAmountForAgentMobileAccount());
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
    ));
  }
}
