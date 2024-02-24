import 'package:flutter/material.dart';

class CustomWhiteBox extends StatelessWidget {
  final Widget child;
  const CustomWhiteBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF1F1F1),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: child,
    );
  }
}
