import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/assets_path.dart';
import '../../core/bloc/phoneauthbloc/phone_auth_bloc.dart';
import '../../dashboard_screen.dart';
import '../../global_widgets/custom_toast.dart';
import '../../global_widgets/keyboard_with_point/keyboard_with_point.dart';
import '../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../global_widgets/white_box_input_field.dart';
import '../blue_bg_screens/otp_screen/otp_screen.dart';

class CustomAnimatedContainer extends StatefulWidget {
  const CustomAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedContainer> createState() =>
      _CustomAnimatedContainerState();
}

class _CustomAnimatedContainerState extends State<CustomAnimatedContainer> {
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
      height = MediaQuery.of(context).size.height * .335;
    }
    return Positioned(
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
        child: isNotClicked
            ? Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    CustomText(
                      text: 'Get Started',
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    CustomText(
                      text: 'Enter Mobile Number',
                      fontSize: 16,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isMaxHeight = !isMaxHeight;
                          isNotClicked = !isNotClicked;
                        });
                      },
                      child: CustomText(
                        text: '03XXXXXXXXX',
                        fontSize: 36,
                        color: AppColors.lightGreyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .015,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: CustomElevatedButton(
                        width: MediaQuery.of(context).size.width * .6,
                        height: 58,
                        onPress: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen(
                                      guest: true,
                                    )),
                          );
                        },
                        primaryColor: AppColors.whiteColor,
                        title: 'Explore as Guest',
                        textColor: AppColors.blueDark,
                        fontSize: 18,
                        alignment: MainAxisAlignment.center,
                      ),
                    )
                  ],
                ),
              )
            : ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                  child: Container(
                    height: MediaQuery.of(context).size.height * .8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocListener<PhoneAuthBloc, PhoneAuthState>(
                                listener: (context, state) {
                              if (state is PhoneAuthLoading) {
                                WidgetsBinding.instance!.addPostFrameCallback(
                                    (_) => loadingDialog(context));
                              } else if (state
                                  is PhoneAuthNumberVerficationFailure) {
                                Navigator.of(context).pop();
                                WidgetsBinding.instance!.addPostFrameCallback(
                                    (_) =>
                                        messageDialog(context, state.message));
                              } else if (state is PhoneAuthError) {
                                Navigator.of(context).pop();
                                WidgetsBinding.instance!.addPostFrameCallback(
                                    (_) => messageDialog(
                                        context, 'Unexpected error occurred.'));
                              } else if (state
                                  is PhoneAuthNumberVerificationSuccess) {
                                Navigator.of(context).pop();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OtpScreen(
                                            phoneNumber: phoneController.text,
                                            verificationId:
                                                state.verificationId)));
                              } else if (state
                                  is PhoneAuthCodeAutoRetrevalTimeoutComplete) {
                                WidgetsBinding.instance!.addPostFrameCallback(
                                    (_) => messageDialog(context,
                                        'Time out for auto retrieval'));
                              }
                            }, child:
                                    BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                                        builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        .04,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 30,
                                    ),
                                    child: Text(
                                      "Get Started",
                                      style: TextStyle(
                                          fontFamily: 'Roboto-Regular',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32,
                                          color: Colors.black),
                                    ),
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
                                        "Enter Mobile Number",
                                        style: TextStyle(
                                            fontFamily: 'Roboto-Regular',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xFF707070)),
                                      ),
                                    ),
                                  ),
                                  // KeyboardDemo(),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                            vertical: 10) +
                                        EdgeInsets.only(top: 10),
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomWhiteBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Form(
                                            key: _formKey,
                                            child:
                                                CustomKeyboardWhiteInboxField(
                                              onChanged: (value) {
                                                setState(() {
                                                  if (value.length > 11) {
                                                    isButtonActive = true;
                                                  } else {
                                                    isButtonActive = false;
                                                  }
                                                });
                                              },
                                              controller: phoneController,
                                              hintText: '03XXXXXXXXX',
                                              fontSize: 36,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              CustomText(
                                                horizontalPadding: 30.0,
                                                text:
                                                    "Please don't share your code",
                                                fontSize: 14,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            })),
                          ],
                        ),
                        Expanded(
                          child: CustomKeyboardWithPoint(
                            onTextInput: (myText) {
                              insertText(myText, phoneController);
                              setState(() {});
                            },
                            onBackspace: () {
                              backspace(phoneController);
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.bottomCenter,
                          child: CustomElevatedButton(
                              width: MediaQuery.of(context).size.width * .8,
                              height: 50,
                              onPress: () {
                                // authProvider.sendCodeToPhone(
                                //     phoneController.text.trim());
                                isButtonActive == true
                                    ? _verifyPhoneNumber(context)
                                    : customToast(
                                        'Please fill the form correctly');
                              },
                              primaryColor: isButtonActive == false
                                  ? AppColors.whiteColor
                                  : AppColors.blueDark,
                              title: 'Continue',
                              textColor: isButtonActive == false
                                  ? AppColors.blueDark
                                  : AppColors.whiteColor,
                              fontSize: 18,
                              alignment: MainAxisAlignment.spaceBetween,
                              image: isButtonActive == false
                                  ? AssetsPath.IC_green_line_bottom_button
                                  : AssetsPath.IC_white_line_bottom_button),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void _verifyPhoneNumber(BuildContext context) {
    String phoneNumber = phoneController.text;
    if (phoneNumber.startsWith("00")) {
      phoneNumber = "+" + phoneNumber.substring(2);
    }
    if (phoneNumber.startsWith("0")) {
      phoneNumber = "+92" + phoneNumber.substring(1);
    }
    BlocProvider.of<PhoneAuthBloc>(context)
        .add(PhoneAuthNumberVerified(phoneNumber: phoneNumber));
  }

  void _verifySMS(BuildContext context, String verificationCode) {
    BlocProvider.of<PhoneAuthBloc>(context).add(PhoneAuthCodeVerified(
        verificationId: verificationCode, smsCode: phoneController.text));
  }

  void loadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Please wait ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircularProgressIndicator(),
                Text(
                  "preparing to Fetch otp",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          );
        });
  }

  void messageDialog(BuildContext context, final message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(message.toString()),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        });
  }
}
