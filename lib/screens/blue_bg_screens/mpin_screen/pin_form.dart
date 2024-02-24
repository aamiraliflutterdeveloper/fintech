import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinForm extends StatefulWidget {
  PinForm(
      {Key? key, required this.onChanged, required this.textEditingController})
      : super(key: key);
  final ValueChanged onChanged;
  final TextEditingController textEditingController;

  @override
  State<PinForm> createState() => _PinFormState();
}

class _PinFormState extends State<PinForm> {
  final formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30),
          child: Container(
            height: 40,
            width: 150,
            child: PinCodeTextField(
              cursorHeight: 2,
              cursorWidth: 2,
              autoFocus: true,
              showCursor: true,
              readOnly: true,
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 4,
              obscureText: true,
              obscuringCharacter: '*',
              // obscuringWidget: FlutterLogo(
              //   size: 24,
              // ),
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              // validator: (v) {
              //   if (v!.length < 3) {
              //     return "I'm from validator";
              //   } else {
              //     return null;
              //   }
              // },

              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(30),
                borderWidth: 2,
                fieldHeight: 25,
                fieldWidth: 25,
                activeFillColor: Colors.white,
                disabledColor: Colors.black,
                activeColor: Colors.white,
                inactiveColor: Color(0xFFF1F1F1),
                inactiveFillColor: Colors.grey,
                errorBorderColor: Color(0xFFF1F1F1),
              ),
              cursorColor: Colors.black,
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: widget.textEditingController,
              keyboardType: TextInputType.number,

              boxShadows: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                print("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: widget.onChanged,
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
          )),
    );
  }
}
