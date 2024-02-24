// import 'package:fintech_app/constants/app_colors.dart';
// import 'package:fintech_app/global_widgets/blue_bg_widget.dart';
// import 'package:fintech_app/global_widgets/custom_elevated_button.dart';
// import 'package:fintech_app/global_widgets/custom_text.dart';
// import 'package:fintech_app/global_widgets/custom_toast.dart';
// import 'package:fintech_app/screens/blue_bg_screens/account_verification_screen/text_field_widget.dart';
// import 'package:fintech_app/screens/blue_bg_screens/mpin_screen/mpin_screen.dart';
// import 'package:fintech_app/utils/nav_router.dart';
// import 'package:flutter/material.dart';
//
// class AccountVerificationScreen extends StatefulWidget {
//   const AccountVerificationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AccountVerificationScreen> createState() =>
//       _AccountVerificationScreenState();
// }
//
// class _AccountVerificationScreenState extends State<AccountVerificationScreen> {
//   var fullNameController = TextEditingController();
//   var emailController = TextEditingController();
//   var idNumberController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool isEnable = false;
//
//   @override
//   void initState() {
//     validateButton();
//     super.initState();
//   }
//
//   void validateButton() {
//     bool isValid = true;
//     isValid = fullNameController.text.isNotEmpty &&
//         emailController.text.isNotEmpty &&
//         idNumberController.text.isNotEmpty;
//
//     setState(() {
//       isEnable = isValid;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlueBgWidget(
//       horizontal: 0.0,
//       child: CustomScrollView(
//         slivers: [
//           SliverFillRemaining(
//             hasScrollBody: false,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       CustomText(
//                         horizontalPadding: 30,
//                         text: 'Account Verification',
//                         fontSize: 32,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       VerificationTextField(
//                         onChanged: (value) {
//                           validateButton();
//                         },
//                         title: 'Full Name',
//                         hintText: 'Enter your full name',
//                         textController: fullNameController,
//                       ),
//                       VerificationTextField(
//                         onChanged: (value) {
//                           validateButton();
//                         },
//                         title: 'Email Address',
//                         hintText: 'YourName@website.com',
//                         textController: emailController,
//                       ),
//                       VerificationTextField(
//                         onChanged: (value) {
//                           validateButton();
//                         },
//                         title: 'Enter ID Number',
//                         hintText: 'xxxxxxxxxxxxx',
//                         textController: idNumberController,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 15),
//                   alignment: Alignment.bottomCenter,
//                   child: CustomElevatedButton(
//                     primaryColor: isEnable == false
//                         ? AppColors.whiteColor
//                         : AppColors.blueDark,
//                     width: MediaQuery.of(context).size.width * .8,
//                     height: 50,
//                     onPress: () {
//                       isEnable == true
//                           ? NavRouter.pushReplacement(context, MPINSScreen())
//                           : customToast('Please fill the form correctly');
//                     },
//                     title: 'Continue To Verify',
//                     textColor: isEnable == false
//                         ? AppColors.blueDark
//                         : AppColors.whiteColor,
//                     fontSize: 18,
//                     alignment: MainAxisAlignment.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
