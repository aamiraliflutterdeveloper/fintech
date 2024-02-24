import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({Key? key, required this.textController, required this.hintText, required this.image}) : super(key: key);
  final TextEditingController textController;
  final String hintText;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0) + EdgeInsets.only(right: 8),
                child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      contentPadding: MediaQuery.of(context).size.width < 600
                          ? EdgeInsets.all(10) +
                          EdgeInsets.only(left: 5, top: 5)
                          : EdgeInsets.all(0) + EdgeInsets.only(left: 10),
                      suffixIcon: InkWell(
                        onTap: () {
                          print("hellhole");
                        },
                        child: Image.asset(
                          image,
                          height: 19,
                          width: 19,
                        ),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F1F1),
                      hintText: hintText,
                      hintStyle:
                      TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
