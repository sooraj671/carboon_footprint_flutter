import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:footprint/controllers/auth_controller.dart';
import 'package:footprint/gen/assets.gen.dart';
import 'package:footprint/gen/colors.gen.dart';
import 'package:footprint/view/app_widgets/button_widget.dart';
import 'package:footprint/view/app_widgets/divider_widget.dart';
import 'package:footprint/view/signUp_screen/signup_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 41),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 75,
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
                  height: 28,
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
                  height: 28,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don’t have an account?  ',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: ColorName.borderColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            authController.emailController.clear();
                            authController.passwordController.clear();
                            authController.confirmPasswordController.clear();
                            Get.to(const SignUpScreen());
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
                        FocusScope.of(context).unfocus();
                        authController.loginUser();

                        // authController.emailController.clear();
                        // authController.passwordController.clear();
                      }
                    },
                    btnText: 'Login'),
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
                //       onTap: () {
                //         authController.signInWithGoogle();
                //       },
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
}
