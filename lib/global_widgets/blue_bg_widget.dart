import 'package:fintech_app/utils/behavior.dart';
import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BlueBgWidget extends StatelessWidget {
  final Widget child;
  final double horizontal;
  final bool? resizeToBottom;
  const BlueBgWidget({Key? key, required this.child, this.horizontal = 20, this.resizeToBottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToBottom,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.blueDark,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 30),
              height: 110,
              width: double.infinity,
              color: AppColors.blueDark,
              alignment: Alignment.bottomCenter,
              child: Container(
                child: CustomText(
                  text: 'FinTech Mobile',
                  color: AppColors.whiteColor,
                  fontSize: 30,
                ),
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: horizontal),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
                  child: child,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:fintech_app/constants/app_colors.dart';
// import 'package:fintech_app/global_widgets/custom_text.dart';
// import 'package:flutter/material.dart';
//
// class BlueBgWidget extends StatelessWidget {
//   final Widget child;
//   final double? horizontal;
//   const BlueBgWidget({Key? key, required this.child, this.horizontal = 20})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(color: AppColors.blueDark),
//           child: Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 6),
//                 height: 110,
//                 width: double.infinity,
//                 color: AppColors.blueDark,
//                 alignment: Alignment.center,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                   child: CustomText(
//                     text: 'FinTech Mobile',
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 29,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding:
//                     EdgeInsets.symmetric(vertical: 30, horizontal: horizontal!),
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30.0),
//                     topRight: Radius.circular(30.0),
//                     bottomLeft: Radius.zero,
//                     bottomRight: Radius.zero,
//                   ),
//                 ),
//                 child: child,
//               )
//             ],
//           ),
//         ),
//       ),
//       // body: Stack(
//       //   children: [
//       //     Container(
//       //       width: double.infinity,
//       //       height: double.infinity,
//       //       decoration: BoxDecoration(color: Colors.black),
//       //       child: child,
//       //     ),
//       //     Positioned(
//       //       top: 0,
//       //       left: 0,
//       //       right: 0,
//       //       child: Container(
//       //         padding: EdgeInsets.symmetric(horizontal: 6),
//       //         height: 70,
//       //         width: double.infinity,
//       //         color: Colors.black,
//       //         alignment: Alignment.center,
//       //         child: Row(
//       //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //           children: [
//       //             IconButton(
//       //               onPressed: () {
//       //                 print('ajksdjkfja');
//       //               },
//       //               icon: SvgImage(
//       //                 path: AssetsPath.IC_ARROW_BACK,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //             IconButton(
//       //               onPressed: () {
//       //                 print('ajksdjkfja');
//       //               },
//       //               icon: SvgImage(
//       //                 path: AssetsPath.IC_CROSS,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ],
//       //         ),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
