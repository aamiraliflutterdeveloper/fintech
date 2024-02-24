import 'dart:async';

import 'package:fintech_app/core/models/slider_model.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 6), (Timer timer) {
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .665,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .22,
                child: Text(
                  "FinTech Mobile",
                  style: TextStyle(
                      fontFamily: 'Roboto-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 29,
                      color: Colors.white),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .335,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    controller: _pageController,
                    itemCount: slider_data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Image.asset(slider_data[index].image.toString()),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .01,
                          ),
                          Text(
                            slider_data[index].title.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontWeight: FontWeight.w900,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .015,
                          ),
                          Text(
                            slider_data[index].desc.toString(),
                            style: TextStyle(
                                fontFamily: 'Roboto-Regular',
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          // Image.asset('assets/Group 616.png'),
                        ],
                      );
                    }),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: slider_data.map((urlOfItem) {
                    int index = slider_data.indexOf(urlOfItem);
                    return Container(
                      width: 12.0,
                      height: 12.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.transparent
                            : Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
