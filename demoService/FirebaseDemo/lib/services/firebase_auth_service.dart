import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  // registerwithEmail;
  static Future<User> registerWithEmail() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "aceBi.com", password: "123456");
      if (userCredential != null) {
        User _user = userCredential.user;
        print("RegisterWithEmail Success");
        return _user;
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException - message: ${e.code}");
    } catch (e) {
      print("Catch in  registerWithEmai- message: $e");
    }
    return null;
  }

  //Login withEmail

  static Future<User> loginWithEmail() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "aceBi@gmail.com", password: "123456");
      if (userCredential != null) {
        User _user = userCredential.user;
        print("RegisterWithEmail Success");
        return _user;
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException - message: ${e.code}");
    } catch (e) {
      print("Catch in  loginWithEmail- message: $e");
    }
    return null;
  }

  // Login with Google

  static Future<User> loginWithGoogle() async {
    try {
      // Trigger the authentication flow
      GoogleSignInAccount _googleUser = await GoogleSignIn().signIn();
      // Get auth details from request
      GoogleSignInAuthentication _googleAuth = await _googleUser.authentication;
      // Create new credential
      GoogleAuthCredential _credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth.accessToken,
        idToken: _googleAuth.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(_credential);
      if (userCredential != null) {
        User _user = userCredential.user;
        print("RegisterWithEmail Success");
        return _user;
      }
    } catch (e) {
      print("Catch in login with google_sign_in: $e");
    }
    return null;
  }

  //Check user is logged

  static User checkUserLogged() {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user;
    } else {
      print("checkUserLogged - // is not logged");
      return null;
    }
  }

  //SignOut

  static void signOut() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    _googleSignIn.signOut();
    await FirebaseAuth.instance
        .signOut()
        .then((value) => print('Signout sucess'));
  }
}
