import 'package:flutter/material.dart';

class AnimatedCheck extends StatefulWidget {
  @override
  _AnimatedCheckState createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.easeInOut);
  late AnimationController checkController = AnimationController(
      duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = 80;
    double iconSize = 60;

    return Container(
      height: circleSize,
      width: circleSize,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Center(
            child: ScaleTransition(
              scale: scaleAnimation,
              child: Container(
                height: circleSize,
                width: circleSize,
                decoration: BoxDecoration(
                  color: Color(0xFF40AA6C),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: checkAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: Center(
              child: Icon(Icons.check, color: Colors.white, size: iconSize),
            ),
          ),
        ],
      ),
    );
  }
}
