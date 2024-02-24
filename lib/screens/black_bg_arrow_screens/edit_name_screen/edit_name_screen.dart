import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/global_widgets/custom_white_box.dart';
import 'package:fintech_app/global_widgets/white_box_input_field.dart';
import 'package:flutter/material.dart';

import '../../../dashboard_screen.dart';
import '../../../global_widgets/custom_toast.dart';
import '../../../utils/nav_router.dart';

class EditNameScreen extends StatefulWidget {
  EditNameScreen({Key? key}) : super(key: key);

  @override
  State<EditNameScreen> createState() => _EditNameScreenState();
}

class _EditNameScreenState extends State<EditNameScreen> {
  late TextEditingController nameController;

  bool isButtonActive = false;
  isButtonEnabled() {
    nameController.addListener(() {
      final isButtonActive = nameController.text.length >= 11;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void initState() {
    nameController = TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              CustomText(
                horizontalPadding: 30,
                verticalPadding: 20,
                text: 'Edit Name',
                fontSize: 32,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                width: MediaQuery.of(context).size.width,
                child: CustomWhiteBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // WhiteBoxInputField(
                        //   controller: nameController,
                        //   hintText: 'Zayn Oskar ',
                        //   hintTextColor: AppColors.lightGreyColor,
                        // ),
                        WhiteBoxInputField(
                          onChanged: (value) {
                            setState(() {
                              isButtonActive = true;
                            });
                            print('called');
                          },
                          controller: nameController,
                          hintText: 'Zayn Oskar',
                          hintTextColor: AppColors.lightGreyColor,
                          fontSize: 30,
                        ),
                        CustomText(
                          horizontalPadding: 30,
                          text: '0/16 characters remaining',
                          fontSize: 16,
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
                      ? NavRouter.pushReplacement(context, DashboardScreen())
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
