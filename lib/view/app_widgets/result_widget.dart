import 'package:flutter/material.dart';

class ThreePartRow extends StatelessWidget {
  final double part1Value;
  final double part2Value;
  final double part3Value;

  ThreePartRow({
    required this.part1Value,
    required this.part2Value,
    required this.part3Value,
  }) : assert(part1Value >= 0 && part1Value <= 100),
        assert(part2Value >= 0 && part2Value <= 100),
        assert(part3Value >= 0 && part3Value <= 100);

  @override
  Widget build(BuildContext context) {
    final totalValue = part1Value + part2Value + part3Value;
    final fraction1 = part1Value / totalValue;
    final fraction2 = part2Value / totalValue;
    final fraction3 = part3Value / totalValue;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: (fraction1 * 100).toInt(),
              child: Container(
                color: Colors.blue,
                height: 50, // You can customize the height as needed
                child: Center(
                  child: Text("Household: \n"+
                    fraction1.toStringAsFixed(3)+"%",
                    style: TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              flex: (fraction2 * 100).toInt(),
              child: Container(
                child: Center(
                  child: Text(
                    "Electricity: \n"+
                    fraction2.toStringAsFixed(3)+"%",
                    style: TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
                color: Colors.green,
                height: 50, // You can customize the height as needed
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: (fraction3 * 100).toInt(),
              child: Container(
                child: Center(
                  child: Text("Transport: \n"+
                    fraction3.toStringAsFixed(3) +"%",
                    style: TextStyle(
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
                color: Colors.red,
                height: 50, // You can customize the height as needed
              ),
            ),
          ],
        ),
      ],
    );
  }
}


