import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footprint/firebase_options.dart';
import 'package:footprint/view/home_screen/home_screen.dart';
import 'package:footprint/view/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));*/
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: Duration(milliseconds: 500),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
