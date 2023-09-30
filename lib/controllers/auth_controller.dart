import 'package:flutter/cupertino.dart';
import 'package:footprint/services/auth_service.dart';
import 'package:footprint/view/home_screen/home_screen.dart';
import 'package:footprint/view/verification_screen/verification_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> registerUser() async {
    String response = await AuthService.signUpWithEmail(
        emailController.text, passwordController.text);
    if (response == "Register user successfully") {
      // todo: add verify screen
      Get.to(
        () => VerificationScreen(email: emailController.text),
      );
    } else {
      Get.rawSnackbar(message: response);
    }
  }

  Future<void> loginUser() async {
    String response = await AuthService.signInWithEmail(
        emailController.text, passwordController.text);
    if (response == "Logged in Successfully") {
      // todo homeScreen
      Get.offAll(const HomeScreen());
    } else if (response == "Email Not Verified") {
      Get.to(
        VerificationScreen(email: emailController.text),
      );
    } else {
      AuthService.signOut();
      Get.rawSnackbar(message: response);
    }
  }

  Future<void> forgetPassword() async {
    String response =
        await AuthService.sendResetPasswordEmail(emailController.text);

    Get.rawSnackbar(message: response);
  }

  Future<void> signInWithGoogle() async {
    String response = await AuthService.signInWithGoogle();
    if (response == "Logged in Successfully") {
      // todo homeScreen
      Get.offAll(const HomeScreen());
    } else if (response == "Email Not Verified") {
      Get.to(
        VerificationScreen(email: emailController.text),
      );
    } else {
      AuthService.signOut();
      Get.rawSnackbar(message: response);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
