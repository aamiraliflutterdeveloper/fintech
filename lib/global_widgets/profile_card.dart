import 'package:fintech_app/global_widgets/fetch_svg.dart';
import 'package:flutter/material.dart';

import 'custom_switch.dart';
import 'custom_text.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final bool isBioMetric;
  final bool isMpin;
  final bool value;
  final bool isContactUs;
  final String? expDate;
  final String icon;
  final VoidCallback onPressed;
  final VoidCallback onTabbed;
  final ValueChanged<bool> onChanged;

  const ProfileCard({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.value,
    this.subTitle,
    this.isBioMetric = false,
    this.isMpin = false,
    this.isContactUs = false,
    this.expDate,
    required this.icon,
    required this.onPressed,
    required this.onTabbed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Card(
        shadowColor: Color(0xFF707070).withOpacity(.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 4,
        child: Container(
          height: 75,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: SvgImage(
                  height: 16,
                  path: icon,
                  color: Color(0xFF255AA8),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: title,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      if (subTitle != null)
                        isMpin
                            ? Row(
                                children: List.generate(
                                    4,
                                    (index) => Container(
                                          margin: EdgeInsets.only(
                                              top: 6, left: index == 0 ? 0 : 8),
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFF255AA8),
                                          ),
                                        )),
                              )
                            : CustomText(
                                text: subTitle!,
                                fontSize: 14,
                              ),
                      if (expDate != null)
                        Row(
                          children: [
                            CustomText(
                              text: 'Expiry: ',
                              fontSize: 14,
                            ),
                            CustomText(
                              text: '01/02/20323',
                              fontSize: 14,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              if (subTitle != null && title != 'CNIC')
                Padding(
                  padding:
                      EdgeInsets.only(left: 12, right: 8, top: 12, bottom: 12),
                  child: IconButton(
                    splashRadius: 28,
                    onPressed: onTabbed,
                    icon: CustomText(
                      text: 'Edit',
                      color: Color(0xFF255AA8),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              if (isBioMetric)
                Padding(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
                  child: CustomSwitch(value: value, onChanged: onChanged),
                ),
              if (isContactUs)
                Padding(
                  padding:
                      EdgeInsets.only(left: 12, right: 8, top: 12, bottom: 12),
                  child: IconButton(
                      splashRadius: 28,
                      onPressed: onTabbed,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Color(0xFF255AA8),
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
