import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BuildDotIndicators extends StatelessWidget {
  const BuildDotIndicators({Key? key, required this.selectedIndex})
      : super(key: key);
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => DotIndicator(isActive: selectedIndex == index),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, required this.isActive}) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          border: isActive ? Border.all(color: AppColors.blueDark) : null,
          shape: BoxShape.circle,
          color: isActive ? Colors.transparent : AppColors.blueDark,
        ),
      ),
    );
  }
}
