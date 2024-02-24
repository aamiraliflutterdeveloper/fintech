import 'package:fintech_app/global_widgets/custom_keyboard_payment.dart';
import 'package:flutter/material.dart';

import '../../utils/behavior.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  double? height;

  bool isMaxHeight = false;
  bool isNotClicked = true;
  List phoneNumber = [];
  String requiredData = "";

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * .8;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/slider_bg.png',
                ),
              )),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * .22,
                    child: Text(
                      "FinTech Mobile",
                      style: TextStyle(
                          fontFamily: 'Roboto-Regular',
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          color: Colors.white),
                    ),
                  ),
                  // below container
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(seconds: 1),
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
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Text(
                          "Enter OTP",
                          style: TextStyle(
                              fontFamily: 'Roboto-Regular',
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .02,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isMaxHeight = !isMaxHeight;
                              isNotClicked = !isNotClicked;
                            });
                          },
                          child: Text(
                            "We sent a code to 030001234567",
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                      ),
                      CustomKeyboardPayment(),
                    ],
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
