import 'package:flutter/material.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:footprint/gen/colors.gen.dart';

class IntroductionPage3 extends StatefulWidget {
  const IntroductionPage3({super.key});

  @override
  State<IntroductionPage3> createState() => _IntroductionPage3State();
}

class _IntroductionPage3State extends State<IntroductionPage3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
      child: Column(
        children: [
          Text(
            'CONGRATS!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Your carbon footprint is lower then Average person',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(child: Assets.images.introResult.image()),
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
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "You are a green hero! Your low-carbon choices help the planet and inspire others. Thank you for your amazing actions! 🌱",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
