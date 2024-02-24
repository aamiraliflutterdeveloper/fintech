import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:fintech_app/utils/behavior.dart';
import 'package:flutter/material.dart';

class BlackBgWidget extends StatelessWidget {
  final Widget child;
  final bool resizeToAvoidBottomInset;
  final double? horizontal;
  const BlackBgWidget(
      {Key? key,
      required this.child,
      this.horizontal = 20,
      this.resizeToAvoidBottomInset = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: AppColors.lightBlackColor),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 15),
              height: 110,
              width: double.infinity,
              color: AppColors.lightBlackColor,
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: SvgImage(
                      path: AssetsPath.IC_ARROW_BACK,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    icon: SvgImage(
                      path: AssetsPath.IC_CROSS,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: horizontal!),
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
      // body: Stack(
      //   children: [
      //     Container(
      //       width: double.infinity,
      //       height: double.infinity,
      //       decoration: BoxDecoration(color: Colors.black),
      //       child: child,
      //     ),
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       right: 0,
      //       child: Container(
      //         padding: EdgeInsets.symmetric(horizontal: 6),
      //         height: 70,
      //         width: double.infinity,
      //         color: Colors.black,
      //         alignment: Alignment.center,
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             IconButton(
      //               onPressed: () {
      //                 print('ajksdjkfja');
      //               },
      //               icon: SvgImage(
      //                 path: AssetsPath.IC_ARROW_BACK,
      //                 color: Colors.white,
      //               ),
      //             ),
      //             IconButton(
      //               onPressed: () {
      //                 print('ajksdjkfja');
      //               },
      //               icon: SvgImage(
      //                 path: AssetsPath.IC_CROSS,
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
