import 'package:fintech_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SenderTile extends StatelessWidget {
  const SenderTile({
    required this.msg,
    Key? key,
  }) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                "Me",
                style: TextStyle(color: Color(0xFFC7C7CC)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
                width: MediaQuery.of(context).size.width * 0.65,
                margin: EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                    color: AppColors.mediumBlueColor,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(40.0),
                      topLeft: const Radius.circular(40.0),
                      bottomRight: const Radius.circular(40.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 16),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
