import 'package:flutter/material.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:footprint/gen/colors.gen.dart';

class IntroductionPage1 extends StatefulWidget {
  const IntroductionPage1({super.key});

  @override
  State<IntroductionPage1> createState() => _IntroductionPage1State();
}

class _IntroductionPage1State extends State<IntroductionPage1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
      child: Column(
        children: [
          Text(
            'What is Carbon Footprint?',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Assets.images.cO2Footprint.image(),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorName.buttonColor),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Carbon footprint is how you change the climate by what you do. Too much carbon dioxide in the air makes the Earth warmer. This gas comes from using oil, coal, and gas. The more energy you use, the more carbon dioxide you produce. This is bad for the Earth and causes problems like melting ice, rising sea levels, and extreme weather.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
