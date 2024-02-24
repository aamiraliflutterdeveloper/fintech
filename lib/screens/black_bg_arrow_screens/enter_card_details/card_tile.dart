import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CardInputField extends StatelessWidget {
  CardInputField(
      {Key? key,
      this.icon,
      this.hintText,
      this.textController,
      this.color = AppColors.lightGreyColor,
      required this.onChanged,
      this.readOnly = false,
      this.textAlign = TextAlign.left})
      : super(key: key);
  TextEditingController? textController;
  final Icon? icon;
  final String? hintText;
  TextAlign? textAlign;
  Color? color;
  final bool readOnly;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: Flexible(
              child: Padding(
                padding: const EdgeInsets.all(0.0) +
                    EdgeInsets.only(right: 25, left: 26),
                child: TextField(
                    readOnly: readOnly,
                    onChanged: onChanged,
                    textAlign: textAlign!,
                    controller: textController,
                    decoration: InputDecoration(
                      contentPadding: size < 600
                          ? EdgeInsets.all(10) +
                              EdgeInsets.only(left: 5, top: 5)
                          : EdgeInsets.all(0) + EdgeInsets.only(left: 10),
                      suffixIcon: icon,
                      filled: true,
                      fillColor: AppColors.whiteColor,
                      hintText: hintText,
                      hintStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: color),
                      border: OutlineInputBorder(
                          //Outline border type for TextFeild
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          borderSide: BorderSide(
                            color: Color(0xFFD5D5D5),
                            width: 1,
                          )),
                      enabledBorder: OutlineInputBorder(
                          //Outline border type for TextFeild
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
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
