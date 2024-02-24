import 'package:fintech_app/constants/assets_path.dart';
import 'package:flutter/material.dart';

class BlueBackgroundWidget extends StatelessWidget {
  final Widget child;
  const BlueBackgroundWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsPath.IC_BLUE_BG), fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
