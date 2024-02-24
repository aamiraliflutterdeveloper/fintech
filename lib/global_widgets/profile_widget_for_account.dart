import 'package:flutter/material.dart';

import '../constants/assets_path.dart';
import 'fetch_svg.dart';

class ProfileWidgetForAccount extends StatefulWidget {
  const ProfileWidgetForAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWidgetForAccount> createState() =>
      _ProfileWidgetForAccountState();
}

class _ProfileWidgetForAccountState extends State<ProfileWidgetForAccount> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(),
          child: Image.asset(
            'assets/profile_pic.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: SvgImage(
                width: 25,
                path: AssetsPath.IC_ARROW_BACK,
                color: Color(0xFF255AA8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
