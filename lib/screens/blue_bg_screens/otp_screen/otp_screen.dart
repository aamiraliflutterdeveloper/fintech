import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/blue_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/screens/account_verification_screen/account_verification_screen.dart';
import 'package:fintech_app/screens/blue_bg_screens/otp_screen/count_down_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/phoneauthbloc/phone_auth_bloc.dart';
import '../../../core/data/repositories/userDataRepository.dart';
import '../../../dashboard_screen.dart';
import '../../../global_widgets/custom_elevated_button.dart';
import '../../../global_widgets/keyboard_with_point/keyboard_with_point.dart';
import '../../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../../../global_widgets/white_box_input_field.dart';
import '../../../utils/nav_router.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const OtpScreen(
      {Key? key, required this.verificationId, required this.phoneNumber})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with TickerProviderStateMixin {
  /// count down data ...
  String? amount;
  late AnimationController? _controller;
  int levelClock = 120;
  bool isEnable = false;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
        );
    _controller?.forward();
    isButtonEnabled();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  isButtonEnabled() {
    otpController.addListener(() {
      final isEnable = otpController.text.length > 5;
      setState(() {
        this.isEnable = isEnable;
      });
    });
  }

  var data;
  String? otp;
  UserDataRepository authCubit = UserDataRepository();

  @override
  Widget build(BuildContext context) {
    return BlueBgWidget(
      resizeToBottom: false,
      horizontal: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocListener<PhoneAuthBloc, PhoneAuthState>(
              listener: (context, state) async {
            if (state is PhoneAuthLoading) {
              WidgetsBinding.instance!
                  .addPostFrameCallback((_) => loadingDialog(context));
            } else if (state is PhoneAuthCodeVerficationFailure) {
              Navigator.of(context).pop();
              WidgetsBinding.instance!.addPostFrameCallback(
                  (_) => messageDialog(context, state.message));
            } else if (state is PhoneAuthCodeVerificationSuccess) {
              bool isExist = await authCubit.isAlreadyExists();
              if (isExist) {
                Navigator.of(context).pop();
                NavRouter.pushReplacement(
                    context,
                    DashboardScreen(
                      userModel: authCubit.userModel,
                    ));
              } else {
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountVerificationScreen(
                            phoneNumber: widget.phoneNumber)));
              }
            }
          }, child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
                  builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  horizontalPadding: 30.0,
                  text: 'Enter OTP',
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(
                  horizontalPadding: 30.0,
                  verticalPadding: 5.0,
                  text: 'We sent a code to ${widget.phoneNumber}',
                  fontSize: 16,
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  child: CustomWhiteBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: _formKey,
                          child: CustomKeyboardWhiteInboxField(
                            onChanged: (value) {
                              setState(() {
                                otp = value;
                                if (value.length > 5) {
                                  isEnable = true;
                                } else {
                                  isEnable = false;
                                }
                              });
                            },
                            controller: otpController,
                            hintText: '063307',
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
                              text: "Please don't share your code",
                              fontSize: 14,
                            ),
                            Countdown(
                              animation: StepTween(
                                begin:
                                    levelClock, // THIS IS A USER ENTERED NUMBER
                                end: 0,
                              ).animate(_controller!),
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
          Expanded(
            child: CustomKeyboardWithPoint(
              onTextInput: (myText) {
                insertText(myText, otpController);
                setState(() {});
              },
              onBackspace: () {
                backspace(otpController);
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
                  // data = authProvider.verifyPhone(otpController.text.trim());
                  // isEnable == true
                  //     ? authProvider.verifyPhone(otpController.text.trim())
                  isEnable == true
                      ? _verifySMS(context, widget.verificationId.toString())
                      // isEnable == true
                      //     ? NavRouter.pushReplacement(
                      //         context, AccountVerificationScreen())
                      : customToast('Please fill the form correctly');
                },
                primaryColor: isEnable == false
                    ? AppColors.whiteColor
                    : AppColors.blueDark,
                title: 'Continue',
                textColor: isEnable == false
                    ? AppColors.blueDark
                    : AppColors.whiteColor,
                fontSize: 18,
                alignment: MainAxisAlignment.spaceBetween,
                image: isEnable == false
                    ? AssetsPath.IC_green_line_bottom_button
                    : AssetsPath.IC_white_line_bottom_button),
          )
        ],
      ),
    );
  }

  void _verifySMS(BuildContext context, String verificationCode) {
    BlocProvider.of<PhoneAuthBloc>(context).add(PhoneAuthCodeVerified(
        verificationId: verificationCode, smsCode: otpController.text));
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
                  "Fintech Verifying otp",
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
