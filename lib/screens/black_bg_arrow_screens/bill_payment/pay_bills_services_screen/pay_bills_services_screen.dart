import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/pay_bills_services_tile.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/bill_payment/pay_bills_number/pay_bills_number_screen.dart';
import 'package:fintech_app/screens/chat_screen/message_input.dart';
import 'package:fintech_app/utils/nav_router.dart';
import 'package:flutter/material.dart';

class PayBillsServicesScreen extends StatefulWidget {
  PayBillsServicesScreen({Key? key}) : super(key: key);

  @override
  State<PayBillsServicesScreen> createState() => _PayBillsServicesScreenState();
}

class _PayBillsServicesScreenState extends State<PayBillsServicesScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      horizontal: 0.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            CustomText(
              horizontalPadding: 30.0,
              verticalPadding: 2.0,
              text: 'Pay Bills',
              fontSize: 32,
            ),
            CustomText(
              horizontalPadding: 30.0,
              verticalPadding: 7.0,
              text: 'Select an Electricity services Provider',
              fontSize: 16,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CustomInput(
                  image: AssetsPath.searchIcon,
                  hintText: 'Search Service provider',
                  textController: searchController,
                ),
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    NavRouter.push(context, payBillsNumberScreen());
                  },
                  child: PayBillsServiceTile(
                    color: Colors.blue,
                    image: AssetsPath.ELECTRIC_LOGO,
                    text: 'K-Electric',
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.LESCO_LOGO,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.IESCO_LOGO,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.PESHAWAR_ELECTRIC,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.MEPCO_LOGO,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.AEDB_LOGO,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.MEPCO_LOGO,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
                PayBillsServiceTile(
                  color: AppColors.whiteColor,
                  image: AssetsPath.AEDB_LOGO,
                  text: 'K-Electric',
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
