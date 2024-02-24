import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/core/models/user_model.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_toast.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/custom_elevated_button.dart';
import '../../../global_widgets/custom_white_box.dart';

class EditEmailScreen extends StatefulWidget {
  EditEmailScreen({Key? key, this.userModel}) : super(key: key);
  final UserModel? userModel;

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}

class _EditEmailScreenState extends State<EditEmailScreen> {
  late TextEditingController editEmailController;

  bool isButtonActive = false;
  isButtonEnabled() {
    editEmailController.addListener(() {
      final isButtonActive = editEmailController.text.length >= 11;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void initState() {
    editEmailController = TextEditingController();
    isButtonEnabled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      horizontal: 0.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              CustomText(
                horizontalPadding: 30,
                verticalPadding: 10,
                text: 'Edit New Email',
                fontSize: 32,
              ),
              CustomText(
                horizontalPadding: 30,
                text: 'Enter new email address',
                fontSize: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WhiteBoxInputField(
                          onChanged: (value) {
                            setState(() {
                              isButtonActive = true;
                            });
                            print('called');
                          },
                          controller: editEmailController,
                          hintText: 'YourName@website.com',
                          hintTextColor: AppColors.lightGreyColor,
                          fontSize: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                onPress: () {
                  isButtonActive == true
                      ? Navigator.of(context).pop()
                      // NavRouter.pushReplacement(
                      //         context,
                      //         DashboardScreen(
                      //           userModel: widget.userModel,
                      //         ))
                      : customToast('Please fill the form correctly');
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
    );
  }
}
