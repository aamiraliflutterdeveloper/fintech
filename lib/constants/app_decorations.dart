import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'assets_path.dart';

InputDecoration chatTextFieldDecoration = InputDecoration(
  suffixIcon: GestureDetector(
    onTap: () {
      print("clicked");
    },
    child: Padding(
      padding: EdgeInsets.all(6),
      child: SvgPicture.asset(
        AssetsPath.BTN_CHAT_SEND,
      ),
    ),
  ),
  filled: true,
  fillColor: Color(0xFFF1F1F1),
  hintText: 'Type your message here...',
  hintStyle: TextStyle(fontSize: 13),
  contentPadding: EdgeInsets.symmetric(horizontal: 10),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Color(0xFFD5D5D5),
        width: 1,
      )),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Color(0xFFD5D5D5),
        width: 1,
      )),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: Color(0xFFD5D5D5),
        width: 1,
      )),
);
