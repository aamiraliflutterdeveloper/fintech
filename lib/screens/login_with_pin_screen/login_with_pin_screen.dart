import 'package:fintech_app/core/bloc/loginbloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import '../../constants/assets_path.dart';
import '../../core/models/user_model.dart';
import '../../dashboard_screen.dart';
import '../../global_widgets/blue_bg_widget.dart';
import '../../global_widgets/custom_elevated_button.dart';
import '../../global_widgets/custom_text.dart';
import '../../global_widgets/custom_toast.dart';
import '../../global_widgets/custom_white_box.dart';
import '../../global_widgets/keyboard_with_point/keyboard_with_point.dart';
import '../../global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import '../blue_bg_screens/mpin_screen/pin_form.dart';

class LoginWithPinScreen extends StatefulWidget {
  const LoginWithPinScreen({Key? key, required this.userModel})
      : super(key: key);
  final UserModel? userModel;
  @override
  State<LoginWithPinScreen> createState() => _LoginWithPinScreenState();
}

class _LoginWithPinScreenState extends State<LoginWithPinScreen> {
  late LoginBloc loginBloc;
  bool isEnable = false;
  String currentText = "";
  final textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    return SafeArea(
      child: BlueBgWidget(
          resizeToBottom: false,
          horizontal: 0.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoadingState) {
                        WidgetsBinding.instance!.addPostFrameCallback(
                            (_) => loadingDialog(context));
                      } else if (state is LoginErrorState) {
                        Navigator.of(context).pop();
                        WidgetsBinding.instance!.addPostFrameCallback(
                            (_) => messageDialog(context, state.message));
                      } else if (state is LoginSuccessState) {
                        Navigator.of(context).pop();

                        UserModel userModel = UserModel(
                            fullName: widget.userModel!.fullName,
                            phoneNumber: widget.userModel!.phoneNumber,
                            emailAddress: widget.userModel!.emailAddress,
                            idNumber: widget.userModel!.idNumber,
                            mpin: currentText);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen(
                                    userModel: userModel, pin: currentText)),
                            (route) => false);
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                    ),
                  ),
                  CustomText(
                    horizontalPadding: 30.0,
                    text: 'Enter Your PIN',
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    horizontalPadding: 30.0,
                    text: 'Enter your 4 digit MPIN',
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
                          PinForm(
                            textEditingController: textEditingController,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                                if (value.length >= 4) {
                                  isEnable = true;
                                } else {
                                  isEnable = false;
                                }
                              });
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            horizontalPadding: 30.0,
                            text:
                                "Don't use same or sequential characters while creating your MPIN",
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomKeyboardWithPoint(
                  onTextInput: (myText) {
                    insertText(myText, textEditingController);
                    setState(() {});
                  },
                  onBackspace: () {
                    backspace(textEditingController);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                    width: MediaQuery.of(context).size.width * .8,
                    onPress: () async {
                      isEnable
                          ? loginBloc
                              .add(LoginButtonPressed(pinCode: currentText))
                          : customToast('Please enter the MPIN');
                      print(currentText);
                    },
                    primaryColor: isEnable == false
                        ? AppColors.whiteColor
                        : AppColors.blueDark,
                    title: 'Continue',
                    textColor: isEnable == false
                        ? AppColors.blueDark
                        : AppColors.whiteColor,
                    alignment: MainAxisAlignment.spaceBetween,
                    image: isEnable == false
                        ? AssetsPath.IC_green_line_bottom_button
                        : AssetsPath.IC_white_line_bottom_button),
              )
            ],
          )),
    );
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
                  "Fintech Login ..",
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
