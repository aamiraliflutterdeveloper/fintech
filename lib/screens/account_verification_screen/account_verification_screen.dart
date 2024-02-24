import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/blue_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/screens/blue_bg_screens/account_verification_screen/text_field_widget.dart';
import 'package:fintech_app/screens/blue_bg_screens/mpin_screen/mpin_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/nav_router.dart';

class AccountVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const AccountVerificationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<AccountVerificationScreen> createState() =>
      _AccountVerificationScreenState();
}

class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var idNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEnable = false;

  @override
  void initState() {
    validateButton();
    super.initState();
  }

  void validateButton() {
    bool isValid = true;
    isValid = fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        idNumberController.text.isNotEmpty;

    setState(() {
      isEnable = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    submit() {
      if (_formKey.currentState!.validate()) {
        NavRouter.pushReplacement(
            context,
            MPINSScreen(
              fullName: fullNameController.text,
              emailAddress: emailController.text,
              idNumber: idNumberController.text,
              phoneNumber: widget.phoneNumber,
            ));
      } else {
        print("Not Validated");
      }
    }

    return BlueBgWidget(
      horizontal: 0.0,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        horizontalPadding: 30,
                        text: 'Account Verification',
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                      VerificationTextField(
                        formFieldValidator: (value) {
                          if (value!.isEmpty) {
                            return 'Please fill the form correctly';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          // if (value.isEmpty) {
                          //   customToast('Please fill the form correctly');
                          // }
                          validateButton();
                        },
                        title: 'Full Name',
                        hintText: 'Enter  your full name',
                        textController: fullNameController,
                      ),
                      VerificationTextField(
                        formFieldValidator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Please Enter Correct Email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          validateButton();
                        },
                        title: 'Email Address',
                        hintText: 'YourName@website.com',
                        textController: emailController,
                      ),
                      VerificationTextField(
                        formFieldValidator: (value) {
                          if (value!.length < 13) {
                            return 'Please Enter Correct ID Number';
                          }
                          return null;
                        },
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) {
                          validateButton();
                        },
                        title: 'Enter ID Number',
                        hintText: 'xxxxxxxxxxxxx',
                        textController: idNumberController,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.bottomCenter,
                  child: CustomElevatedButton(
                    primaryColor: isEnable == false
                        ? AppColors.whiteColor
                        : AppColors.blueDark,
                    width: MediaQuery.of(context).size.width * .8,
                    onPress: () {
                      //
                      isEnable == true
                          ? submit()
                          : customToast('Please fill the form correctly');
                    },
                    title: 'Continue To Verify',
                    textColor: isEnable == false
                        ? AppColors.blueDark
                        : AppColors.whiteColor,
                    alignment: MainAxisAlignment.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
