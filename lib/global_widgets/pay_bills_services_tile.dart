import 'package:flutter/material.dart';

class PayBillsServiceTile extends StatelessWidget {
  PayBillsServiceTile(
      {Key? key, this.color, this.image, this.text, this.subtitle})
      : super(key: key);
  Color? color;
  String? image;
  String? text;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0),
      child: Card(
        elevation: 0,
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54,
                  blurRadius: 1.0,
                  offset: Offset(.75, .5))
            ],
            color: color,
            borderRadius: BorderRadius.circular(60),
          ),
          child: ListTile(
            selectedTileColor: Colors.blue,
            leading: Image.asset(
              image!,
              width: 45,
            ),
            title: Text(text!),
          ),
        ),
      ),
    );
  }
}
