import 'package:flutter/material.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:get/get.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, this.appBar, required this.body});
  final AppBar? appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: body,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.images.background.path),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
