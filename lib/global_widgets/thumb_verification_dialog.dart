import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

thumbDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
          height: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel,
                      color: AppColors.blueDark,
                    )),
              ),
              Icon(
                Icons.fingerprint,
                size: 120,
                color: AppColors.blueDark,
              ),
              Text(
                "Login Via Fingerprint",
                style: TextStyle(color: AppColors.blueDark, fontSize: 20),
              ),
            ],
          ),
        ));
      });
}
