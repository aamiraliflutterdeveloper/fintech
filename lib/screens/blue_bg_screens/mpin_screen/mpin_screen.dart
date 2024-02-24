import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/core/models/user_model.dart';
import 'package:fintech_app/dashboard_screen.dart';
import 'package:fintech_app/global_widgets/blue_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/keyboard_with_point/keyboard_with_point.dart';
import 'package:fintech_app/global_widgets/keyboard_with_thumb/keyboard_methods.dart';
import 'package:fintech_app/screens/blue_bg_screens/mpin_screen/pin_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/registerbloc/register_bloc.dart';

class MPINSScreen extends StatefulWidget {
  final UserModel? userModel;
  final String? fullName;
  final String? emailAddress;
  final String? idNumber;
  final String? phoneNumber;
  final String routeName;

  const MPINSScreen({
    this.fullName,
    this.emailAddress,
    this.idNumber,
    this.phoneNumber,
    this.routeName = '',
    this.userModel,
    Key? key,
  }) : super(key: key);

  @override
  State<MPINSScreen> createState() => _MPINSScreenState();
}

class _MPINSScreenState extends State<MPINSScreen> {
  bool isEnable = false;
  String currentText = "";
  final textEditingController = TextEditingController();
  late RegisterBloc registerBloc;

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
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
                  BlocListener<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                        WidgetsBinding.instance!.addPostFrameCallback(
                            (_) => loadingDialog(context));
                      } else if (state is RegisterFailed) {
                        Navigator.of(context).pop();
                        WidgetsBinding.instance!.addPostFrameCallback(
                            (_) => messageDialog(context, state.message));
                      } else if (state is RegisterSucceed) {
                        Navigator.of(context).pop();

                        UserModel userModel = UserModel(
                            fullName: widget.fullName!,
                            phoneNumber: widget.phoneNumber!,
                            emailAddress: widget.emailAddress!,
                            idNumber: widget.idNumber!,
                            mpin: currentText);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DashboardScreen(userModel: userModel)),
                            (route) => false);
                      }
                    },
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return SizedBox(
                          height: 25,
                        );
                      },
                    ),
                  ),
                  CustomText(
                    horizontalPadding: 30.0,
                    text: 'Create MPIN',
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
                          ? registerBloc.add(RegisterButtonPressed(
                              id: widget.phoneNumber!,
                              emailAddress: widget.emailAddress!,
                              fullName: widget.fullName!,
                              phoneNumber: widget.phoneNumber!,
                              idNumber: widget.idNumber!,
                              mpin: currentText))
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
                  "Loading Data ..",
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
