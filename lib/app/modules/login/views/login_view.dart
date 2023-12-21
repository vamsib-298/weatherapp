import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/app/modules/home/views/home_view.dart';
import 'package:weatherapp/app/modules/login/controllers/login_controller.dart';
import 'package:weatherapp/res/colors/app_color.dart';

class LoginView extends GetView<LoginController> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final Logger _logger = Logger();

  LoginView({super.key});

  Future<void> _handleSignInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      if (_googleSignIn.currentUser != null) {
        Get.off(() => const HomeView()); // Change to HomeView
        // Save authentication state
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
      } else {
        _logger.e('User is not signed in with Google.');
      }
    } catch (error) {
      _logger.e('Error during Google Sign In: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginView,
      appBar: AppBar(
        title: const Text('Login'), // Changed title
        backgroundColor:AppColors.loginBackground,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await _handleSignInWithGoogle();
              },
              child: const Center( child:Text('Login with Google'),), // Changed button text
            ),
          ],
        ),
      ),
    );
  }
}
