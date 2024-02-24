import 'package:fintech_app/constants/assets_path.dart';
import 'package:flutter/material.dart';

class HomeBgWidget extends StatelessWidget {
  final Widget child;
  const HomeBgWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetsPath.BG_IMAGE_PNG), fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}
