import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/black_bg_widget.dart';
import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/bill_payment/review_bill_payment_screen/review_bill_service_tile.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/enter_otp_black_bg/enter_otp_black_bg.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/schedule_transactions_screen/frequency_expansion_tile.dart';
import 'package:fintech_app/screens/black_bg_arrow_screens/schedule_transactions_screen/scheduleInputField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../global_widgets/custom_toast.dart';
import '../../../utils/nav_router.dart';

class ScheduleTransactionScreen extends StatefulWidget {
  const ScheduleTransactionScreen({Key? key}) : super(key: key);
  @override
  State<ScheduleTransactionScreen> createState() =>
      _ScheduleTransactionScreenState();
}

class _ScheduleTransactionScreenState extends State<ScheduleTransactionScreen> {
  final fullNameController = TextEditingController();
  final idController = TextEditingController();
  final mobileController = TextEditingController();
  final amountController = TextEditingController();
  TextEditingController firstExecutionDate = TextEditingController();
  TextEditingController lastExecutionDate = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    validateButton();
    super.initState();
  }

  bool _isChecked = false;
  bool valuesecond = false;
  String? timePickerDate;
  DateTime? _firstSelectedDate;
  DateTime? _lastSelectedDate;
  DateTime selectedDate = DateTime.now();
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'july',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  bool isEnable = false;
  void validateButton() {
    bool isValid = true;
    isValid = fullNameController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        firstExecutionDate.text.isNotEmpty &&
        idController.text.isNotEmpty;

    setState(() {
      isEnable = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlackBgWidget(
      horizontal: 0.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            CustomText(
              horizontalPadding: 30,
              verticalPadding: 10,
              text: 'Schedule Transactions',
              fontSize: 32,
            ),
            CustomText(
              horizontalPadding: 30,
              text: 'Form Account',
              fontSize: 12,
            ),
            ReviewBillsServiceTile(
              title: 'Zayn Oskar ',
              subtitle: '03XXXXXXXXX',
              image: AssetsPath.reviewBillProfile,
              color: AppColors.blueDark,
            ),
            CustomText(
              horizontalPadding: 30,
              verticalPadding: 15,
              text: 'To',
              fontSize: 12,
            ),
            ToFormData(context)
          ],
        ),
      ),
    );
  }

  Widget ToFormData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          horizontalPadding: 30,
          text: 'Full Name',
          fontSize: 18,
          color: AppColors.blueDark,
        ),
        ScheduleInputField(
          onChanged: (value) {
            validateButton();
          },
          controller: fullNameController,
          hintText: 'Davis john',
          borderColor: AppColors.greyLastColor,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomText(
            horizontalPadding: 30,
            text: 'Enter ID Card Number ',
            fontSize: 18,
            color: AppColors.blueDark,
          ),
        ),
        ScheduleInputField(
          onChanged: (value) {
            validateButton();
          },
          controller: idController,
          hintText: '1234567892589',
          borderColor: AppColors.greyLastColor,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomText(
            horizontalPadding: 30,
            text: 'Enter Mobile Number',
            fontSize: 18,
            color: AppColors.blueDark,
          ),
        ),
        ScheduleInputField(
          onChanged: (value) {
            validateButton();
          },
          controller: mobileController,
          hintText: '03123456789',
          borderColor: AppColors.greyLastColor,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomText(
            horizontalPadding: 30,
            text: 'Enter Amount ',
            fontSize: 18,
            color: AppColors.blueDark,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: ScheduleInputField(
                  onChanged: (value) {
                    validateButton();
                  },
                  isSuffix: true,
                  controller: amountController,
                  hintText: 'Rs . 50,000',
                  borderColor: AppColors.greyLastColor,
                ),
              ),
            ),
            Container(
              height: 58,
              decoration: BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 1.5, color: AppColors.greyLastColor),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 45),
                child: Row(
                  children: [
                    Image.asset(AssetsPath.textFieldGreenLine),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: 'PKR',
                      fontSize: 18,
                      color: AppColors.blueDark,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .7,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: CustomText(
                    horizontalPadding: 30,
                    text:
                        'Please Select if you want to Schedule this Payment for future ',
                    fontSize: 18,
                    color: AppColors.blueDark,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0) +
                    EdgeInsets.only(top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: _isChecked == true
                            ? AppColors.blueDark
                            : AppColors.blueDark,
                        width: 1.2),
                  ),
                  width: 22,
                  height: 22,
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.white),
                    child: Checkbox(
                      checkColor: AppColors.blueDark,
                      activeColor: Colors.transparent,
                      value: _isChecked,
                      tristate: false,
                      onChanged: (isChecked) {
                        setState(() {
                          _isChecked = isChecked!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: CustomText(
            horizontalPadding: 30,
            verticalPadding: 10,
            text: 'Frequency',
            fontSize: 16,
            color: AppColors.darkGreyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        FrequencyExpansionTile(),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomText(
            horizontalPadding: 30,
            text: 'First Execution Date',
            fontSize: 18,
            color: AppColors.blueDark,
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(),
          child: AbsorbPointer(
              child: ScheduleInputField(
            onChanged: (value) {
              validateButton();
            },
            controller: firstExecutionDate,
            hintText: '01 | December | 2019',
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: CustomText(
            horizontalPadding: 30,
            text: 'Last Execution Date',
            fontSize: 18,
            color: AppColors.blueDark,
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate1(),
          child: AbsorbPointer(
              child: ScheduleInputField(
            onChanged: (value) {
              validateButton();
            },
            controller: lastExecutionDate,
            hintText: '06 | December | 2019',
          )),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.bottomCenter,
          child: CustomElevatedButton(
            primaryColor:
                isEnable == false ? AppColors.whiteColor : AppColors.blueDark,
            width: MediaQuery.of(context).size.width * .8,
            height: 50,
            onPress: () {
              isEnable == true
                  ? NavRouter.push(context, EnterOTPBlackScreen())
                  : customToast('Please fill the form correctly');
            },
            title: 'Payment Schedule',
            textColor:
                isEnable == false ? AppColors.blueDark : AppColors.whiteColor,
            fontSize: 18,
            alignment: MainAxisAlignment.center,
          ),
        ),
      ],
    );
  }

  _selectDate() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime? tempPickedDate;
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != _firstSelectedDate) {
      setState(() {
        // _selectedDate = pickedDate;
        print(" this is picked date $pickedDate");
        var mon = pickedDate.month;
        print("this is picked month $mon");
        print(months[mon - 1]);
        var monthName = months[mon - 1];
        print("this is month name $monthName");
        print("this is exact data ");
        firstExecutionDate.text =
            "${pickedDate.day} | ${monthName} | ${pickedDate.year}";
        print(monthName);
      });
    }
  }

  _selectDate1() async {
    DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) {
        DateTime? tempPickedDate;
        return Container(
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CupertinoButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoButton(
                      child: Text('Done'),
                      onPressed: () {
                        Navigator.of(context).pop(tempPickedDate);
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 1,
              ),
              Expanded(
                child: Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime dateTime) {
                      tempPickedDate = dateTime;
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    if (pickedDate != null && pickedDate != _firstSelectedDate) {
      setState(() {
        // _selectedDate = pickedDate;
        print(" this is picked date $pickedDate");
        var mon = pickedDate.month;
        print("this is picked month $mon");
        print(months[mon - 1]);
        var monthName = months[mon - 1];
        print("this is month name $monthName");
        print("this is exact data ");
        lastExecutionDate.text =
            "${pickedDate.day} | ${monthName} | ${pickedDate.year}";
        print(monthName);
      });
    }
  }
}
