import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/screens/qr_code_screen/recent_scans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/assets_path.dart';
import '../../utils/nav_router.dart';
import '../black_bg_arrow_screens/qr_payment_screen/qr_payment_screen.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlackColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .2,
                alignment: Alignment.center,
                child: Padding(
                  padding:
                      const EdgeInsets.all(25.0) + EdgeInsets.only(top: 45),
                  child: Text(
                    "Use Camera to scan FinTech business QR code and pay",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .8,
                decoration: BoxDecoration(
                    color: AppColors.blueDark,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AssetsPath.IC_Master_Card,
                            semanticsLabel: 'IC_Master_Card'),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(AssetsPath.IC_Qr_Code_White_Line,
                            semanticsLabel: 'IC_Qr_Code_White_Line'),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: SvgPicture.asset(AssetsPath.IC_Qr_To_Pay,
                              semanticsLabel: 'IC_Qr_To_Pay'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 320,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 9,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 280,
                              width: 280,
                              child: SvgPicture.asset(AssetsPath.IC_QR_Code,
                                  height: 279.96, semanticsLabel: 'IC_QR_Code'),
                            ),
                          ),
                          Positioned(
                            top: 265,
                            left: 110,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  child: SvgPicture.asset(
                                      AssetsPath.IC_Circle_Button_QR_Code,
                                      semanticsLabel:
                                          'IC_Circle_Button_QR_Code'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.blueDark,
                                    fixedSize: const Size(45, 45),
                                    shape: const CircleBorder(),
                                  ),
                                ),
                                SizedBox(
                                  width: 28,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColors.blueDark,
                                      shape: StadiumBorder()),
                                  child: Text(
                                    'Enter Till ID',
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  onPressed: () {
                                    NavRouter.push(context, QRPaymentScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    // CustomAnimatedContainer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(35),
                            topLeft: Radius.circular(35),
                          )),
                      height: 150,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: SvgPicture.asset(
                                    AssetsPath.IC_QR_Code_Green_Line,
                                    width: 61,
                                    semanticsLabel: 'IC_QR_Code_Green_Line'),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 18.0, top: 15),
                                child: Text(
                                  "Recent Scans",
                                  style: TextStyle(
                                    color: AppColors.blueDark,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 32,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 28,
                                    color: AppColors.blueDark,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  CustomText(
                                    text: 'View Recent Scans',
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          RecentScansContainer(),
        ],
      ),
    );
  }
}
