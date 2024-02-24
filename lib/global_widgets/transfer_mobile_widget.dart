import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../constants/assets_path.dart';
import 'fetch_svg.dart';

class TransferMobileWidget extends StatelessWidget {
  final String name;
  final String mobile;
  final String? image;
  final bool? isAvailable;
  final VoidCallback onPressed;
  const TransferMobileWidget({
    Key? key,
    required this.onPressed,
    required this.name,
    required this.mobile,
    this.image,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
      ),
      title: CustomText(
        text: name,
        fontSize: 18,
        color: Color(0xFF255AA8),
        fontWeight: FontWeight.w500,
      ),
      subtitle: CustomText(
        text: mobile,
        fontSize: 14,
        color: Color(0xFFC7C7CC),
        fontWeight: FontWeight.w500,
      ),
      trailing: isAvailable!
          ? IconButton(
              onPressed: onPressed,
              icon: SvgImage(
                path: AssetsPath.IC_TRANSFER,
              ),
            )
          : GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xFF255AA8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CustomText(
                  text: 'invite',
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
