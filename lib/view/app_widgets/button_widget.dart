import 'package:flutter/material.dart';
import 'package:footprint/gen/colors.gen.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.function,
    required this.btnText,
  });
  final Function function;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(290, 50),
          backgroundColor: ColorName.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        ),
        onPressed: () => function.call(),
        child: Text(btnText));
  }
}
