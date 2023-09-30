import 'package:flutter/material.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/view/home_screen/home_screen.dart';
import 'package:footprint/view/introduction_screen/pages/introduction_page1.dart';
import 'package:footprint/view/introduction_screen/pages/introduction_page2.dart';
import 'package:footprint/view/introduction_screen/pages/introduction_page3.dart';
import 'package:get/get.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final List<Widget> introPages = [
    IntroductionPage1(),
    IntroductionPage2(),
    IntroductionPage3()
  ];
  final PageController _pageController = PageController(initialPage: 0);
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: introPages.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return introPages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(
              introPages.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: _activePage == index
                      ? ColorName.buttonColor
                      : ColorName.unselectedBtnColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (_activePage < introPages.length - 1) {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              } else {
                Get.to(HomeScreen());
              }
            },
            style: ElevatedButton.styleFrom(
                fixedSize: Size(120, 45),
                backgroundColor: ColorName.buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(47))),
            child: Text(
                _activePage == introPages.length - 1 ? "Continue" : 'Next'),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
