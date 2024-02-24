import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ReviewBillsServiceTile extends StatelessWidget {
  const ReviewBillsServiceTile(
      {Key? key,
      this.subtitle,
      this.title,
      this.textButton,
      this.image,
      this.color = AppColors.blackColor})
      : super(key: key);
  final String? title;
  final String? subtitle;
  final String? textButton;
  final String? image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(image!),
          ),
          trailing: Container(
              child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: textButton != null
                ? Text(textButton.toString())
                : Container(
                    width: 2,
                  ),
          )),
          title: Text(
            title!,
            style: TextStyle(color: color),
          ),
          subtitle: Text(subtitle!),
        ),
      ),
    );
  }
}
