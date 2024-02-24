import 'package:fintech_app/constants/assets_path.dart';
import 'package:fintech_app/screens/intro_screen/slider_widget.dart';
import 'package:flutter/material.dart';

import 'animatd_container.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  AssetsPath.sliderBg,
                ),
              )),
              child: Column(
                children: [
                  SliderWidget(),
                  // below container
                ],
              )),
          CustomAnimatedContainer(),
        ],
      ),
    );
  }
}
