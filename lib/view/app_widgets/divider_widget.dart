import 'package:flutter/material.dart';
import 'package:footprint/gen/colors.gen.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Expanded(
          child: Divider(
            height: 12,
            thickness: 1,
            color: ColorName.borderColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Expanded(
          child: Divider(
            height: 12,
            thickness: 1,
            color: ColorName.borderColor,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
