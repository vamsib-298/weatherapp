// login_controller.dart
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  GoogleSignIn get googleSignIn => _googleSignIn;
  

  Future<void> loginWithGoogle() async {
    try {
      await _googleSignIn.signInSilently();
      // If signInSilently is not successful, fall back to signIn.
      if (_googleSignIn.currentUser == null) {
        await _googleSignIn.signIn();
      }
    } catch (error) {
      print('Error during Google Sign In: $error');
    }
  }
}
