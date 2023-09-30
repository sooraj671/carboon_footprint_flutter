import 'package:flutter/material.dart';
import 'package:footprint/gen/assets.gen.dart';

class IntroductionPage2 extends StatefulWidget {
  const IntroductionPage2({super.key});

  @override
  State<IntroductionPage2> createState() => _IntroductionPage2State();
}

class _IntroductionPage2State extends State<IntroductionPage2> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
      child: Column(
        children: [
          Text(
            'What is Our Goal?',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Assets.images.ourGoal.image(),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Carbon neutral means having a balance between emitting carbon and absorbing carbon from the atmosphere. To achieve carbon neutrality, You can reduce your carbon footprint by using less or cleaner energy, driving less, eating less meat, buying local and organic products, and recycling and composting waste. This can help slow down climate change and protect the Earth.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
