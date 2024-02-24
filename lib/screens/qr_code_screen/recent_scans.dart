import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/assets_path.dart';

class RecentScansContainer extends StatefulWidget {
  const RecentScansContainer({Key? key}) : super(key: key);

  @override
  State<RecentScansContainer> createState() => _RecentScansContainerState();
}

class _RecentScansContainerState extends State<RecentScansContainer> {
  double? height;

  bool isMaxHeight = false;
  bool isNotClicked = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  bool isButtonActive = false;
  isButtonEnabled() {
    phoneController.addListener(() {
      final isButtonActive = phoneController.text.length >= 11;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  void initState() {
    isButtonEnabled();
    super.initState();
  }

  String? verId;
  String? phone;
  bool codeSent = false;

  String verificationId = '';

  @override
  Widget build(BuildContext context) {
    if (isMaxHeight) {
      height = MediaQuery.of(context).size.height * .8;
    } else {
      height = 150;
    }
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300),
        height: height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        child: isNotClicked
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                        padding: const EdgeInsets.only(top: 15),
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
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          size: 28,
                          color: AppColors.blueDark,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              isMaxHeight = !isMaxHeight;
                              isNotClicked = !isNotClicked;
                            });
                          },
                          child: CustomText(
                            text: 'View Recent Scans',
                            fontSize: 16,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                  ],
                ),
              )
            : ScrollConfiguration(
                behavior: MyBehavior(),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * .8,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isMaxHeight = !isMaxHeight;
                                isNotClicked = !isNotClicked;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 12.0,
                                top: 12,
                              ),
                              child: Icon(Icons.cancel),
                            ),
                          ),
                          alignment: Alignment.topRight,
                        ),
                        CustomText(
                          text: 'Recent Scans',
                          fontSize: 25,
                          horizontalPadding: 20,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey
                                    .shade300, //                   <--- border color
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: '10\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'March 2022',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'PKR 900000.00 Credits\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '03XXXXXXXXX',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "HBL",
                                    style: TextStyle(color: AppColors.blueDark),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey
                                    .shade300, //                   <--- border color
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: '15\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'April 2022',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'PKR 5,00,000.00 Credits\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '03XXXXXXXXX',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Allied Bank",
                                    style: TextStyle(color: AppColors.blueDark),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey
                                    .shade300, //                   <--- border color
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: '13\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'August 2022',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'PKR 400000.00 Credits\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '03XXXXXXXXX',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Bank Alfalah",
                                    style: TextStyle(color: AppColors.blueDark),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey
                                    .shade300, //                   <--- border color
                                width: 1.0,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                    10.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: '10\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'July 2022',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                            text: 'PKR 700000.00 Credits\n',
                                            style: TextStyle(
                                                color: AppColors.blueDark,
                                                fontSize: 14),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '03XXXXXXXXX',
                                                style: TextStyle(
                                                    color: AppColors.blueDark,
                                                    fontSize: 14),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Bank of Punjab",
                                    style: TextStyle(color: AppColors.blueDark),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
