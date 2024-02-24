import 'package:flutter/material.dart';

class VerificationTextField extends StatelessWidget {
  const VerificationTextField(
      {Key? key,
      required this.hintText,
      required this.title,
      required this.textController,
      required this.onChanged,
      this.formFieldValidator,
      this.keyboardType})
      : super(key: key);
  final String title;
  final String hintText;
  final TextEditingController textController;
  final ValueChanged onChanged;
  final FormFieldValidator<String>? formFieldValidator;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF707070),
                    fontSize: 18,
                    fontFamily: 'Roboto-Regular'),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            TextFormField(
                validator: formFieldValidator,
                keyboardType: keyboardType,
                onChanged: onChanged,
                controller: textController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF1F1F1),
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffC7C7CC)),
                  border: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFFD5D5D5),
                        width: 1,
                      )),
                  enabledBorder: OutlineInputBorder(
                      //Outline border type for TextFeild
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFFD5D5D5),
                        width: 1,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Color(0xFFD5D5D5),
                        width: 1,
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
