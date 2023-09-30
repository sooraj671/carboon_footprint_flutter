import 'package:flutter/material.dart';
import 'package:footprint/bindings/auth_binding.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:footprint/services/auth_service.dart';
import 'package:footprint/view/home_screen/home_screen.dart';
import 'package:footprint/view/login_screen/login_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      print(AuthService.auth.currentUser);
      if (AuthService.auth.currentUser == null) {
        Get.off(() => const LoginScreen(), binding: AuthBinding());
      } else {
        if (AuthService.auth.currentUser!.emailVerified) {
          Get.off(HomeScreen());
        } else {
          Get.off(() => const LoginScreen(), binding: AuthBinding());
        }
      }
    });
  }

  @override
  void initState() {
    splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Assets.images.splashScreen.image(
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
