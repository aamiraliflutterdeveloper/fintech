import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/global_widgets/home_bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MartScreen extends StatelessWidget {
  const MartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: HomeBgWidget(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsPath.IC_COMING_SOON,
                semanticsLabel: 'Coming Soon Logo'),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Text(
                "Something Exciting is coming for you",
                style: TextStyle(fontSize: 27),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: Text(
                "we are currently working on it.",
                style: TextStyle(fontSize: 12, letterSpacing: .5),
              ),
            ),
          ],
        ),
      )
    );
  }
}
