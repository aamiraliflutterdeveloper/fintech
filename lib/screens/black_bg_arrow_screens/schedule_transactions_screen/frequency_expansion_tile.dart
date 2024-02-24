import 'dart:math';

import 'package:fintech_app/constants/app_colors.dart';
import 'package:fintech_app/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FrequencyExpansionTile extends StatefulWidget {
  @override
  FrequencyExpansionTileState createState() =>
      new FrequencyExpansionTileState();
}

class FrequencyExpansionTileState extends State {
  String title = 'Daily';
  int? _key;
  int? newKey;
  bool isClicked = false;
  _collapse() {
    do {
      _key = new Random().nextInt(10000);
    } while (newKey == _key);
  }

  @override
  void initState() {
    super.initState();
    _collapse();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
          tilePadding:
              EdgeInsets.symmetric(horizontal: 30) + EdgeInsets.only(right: 22),
          key: new Key(_key.toString()),
          initiallyExpanded: isClicked ? false : true,
          title: CustomText(
            text: this.title,
            fontSize: 18,
            color: AppColors.blueDark,
          ),
          backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              padding: EdgeInsets.symmetric(vertical: 10) +
                  EdgeInsets.only(right: 0),
              width: MediaQuery.of(context).size.width * .85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(
                    color: Colors.grey.shade200,
                    width: 2,
                  )),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        this.title = 'One time';
                        _collapse();
                        isClicked = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: AppColors.lightGreyColor,
                        )),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0) +
                            EdgeInsets.only(left: 10.0),
                        child: CustomText(
                          text: 'One time',
                          fontSize: 18,
                          color: AppColors.blueDark,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        this.title = 'Daily';
                        _collapse();
                        isClicked = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0) +
                            EdgeInsets.only(left: 10.0),
                        child: CustomText(
                          text: 'Daily',
                          fontSize: 18,
                          color: AppColors.blueDark,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        this.title = 'Weekly';
                        _collapse();
                        isClicked = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.lightGreyColor,
                          ),
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0) +
                            EdgeInsets.only(left: 10.0),
                        child: CustomText(
                          text: 'Weekly',
                          fontSize: 18,
                          color: AppColors.blueDark,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        this.title = 'Monthly';
                        _collapse();
                        isClicked = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0) +
                            EdgeInsets.only(left: 10.0),
                        child: CustomText(
                          text: 'Monthly',
                          fontSize: 18,
                          color: AppColors.blueDark,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
