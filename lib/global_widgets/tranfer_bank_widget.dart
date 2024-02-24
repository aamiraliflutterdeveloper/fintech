import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TransferBankWidget extends StatelessWidget {
  final String name;
  final String image;
  const TransferBankWidget({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 70,
      child: Card(
        elevation: 4,
        shadowColor: Color(0xFF707070).withOpacity(.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomText(
                  text: name,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
