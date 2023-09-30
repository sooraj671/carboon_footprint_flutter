import 'package:firebase_auth/firebase_auth.dart';
import 'package:footprint/controllers/data_controller.dart';
import 'package:footprint/view/login_screen/login_screen.dart';
import 'package:get/get.dart';


import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  AuthService._();

  static final FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String> signUpWithEmail(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      return "Register user successfully";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      }
      return "Firebase Error";
    } catch (e) {
      return "server connection error";
    }
  }

  static Future<String> signInWithEmail(String email, String password) async {
    try {
      final credentials = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credentials.user!.emailVerified) {
        uid = credentials.user!.uid.toString();
        return "Logged in Successfully";
      } else {
        return "Email Not Verified";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        return "Wrong password";
      }
      return "Firebase Error";
    } catch (e) {
      return "server connection error";
    }
  }

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static Future<String> sendResetPasswordEmail(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return "The Reset Password mail has been send to your email account";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } catch (e) {
      return "server connection error";
    }
  }

  static Future<String> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // print("Printing UID inside google: "+userCredential.user!.uid.toString());

      return "Logged in Successfully";
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } catch (e) {
      return "server connection error";
    }
  }

  // Function to perform user logout
  static Future<void> signOutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      // The user is now signed out.

      Get.to(LoginScreen());
    } catch (e) {
      print('Error signing out: $e');
    }
  }
}
