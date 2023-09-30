import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:footprint/controllers/auth_controller.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/view/app_widgets/button_widget.dart';
import 'package:footprint/view/app_widgets/divider_widget.dart';
import 'package:footprint/view/login_screen/login_screen.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();
  String confirmPassText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorName.buttonColor),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(41, 90, 41, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  textAlign: TextAlign.start,
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: authController.emailController,
                  textAlign: TextAlign.center,
                  validator: (val) => validate(val!),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(
                          color: ColorName.buttonColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.start,
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  controller: authController.passwordController,
                  textAlign: TextAlign.center,
                  validator: (val) => validate(val!),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(
                          color: ColorName.buttonColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  textAlign: TextAlign.start,
                  'Confirm Password',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      confirmPassText = value;
                    });
                  },
                  controller: authController.confirmPasswordController,
                  textAlign: TextAlign.center,
                  validator: (val) => confirmPasswordValidate(val!),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                      borderSide: const BorderSide(
                          color: ColorName.buttonColor, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?  ',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: ColorName.borderColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(const LoginScreen());
                          },
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: ColorName.buttonColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtonWidget(
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        authController.registerUser();
                      }
                    },
                    btnText: 'Sign Up'),
                const SizedBox(
                  height: 50,
                ),
                // const DividerWidget(),
                // const SizedBox(
                //   height: 15,
                // ),
                // const Text(
                //   'Connect with',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       child: Assets.images.google.image(),
                //       onTap: () {},
                //     ),
                //     InkWell(
                //       child: Assets.images.facebook.image(),
                //       onTap: () {},
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? validate(String val) {
    if (val.isEmpty) {
      return "Required";
    }
    return null;
  }

  String? confirmPasswordValidate(String val) {
    if (val.isEmpty) {
      return "Required";
    } else if (val != authController.passwordController.text) {
      return "Password not match";
    }
    return null;
  }
}