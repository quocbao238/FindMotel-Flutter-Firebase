import 'package:firebase_core/firebase_core.dart';

class FirebaseCoreService {
  static FirebaseOptions firebaseOptions = FirebaseOptions(
      appId: "1:1010697707354:android:d4f3a7f928ccffe9ef5d63",
      apiKey: "AIzaSyBzuFMCG5j2haRzU7wa6GNoj9xGI3R2xgY",
      projectId: "findmotel-cc4ed",
      messagingSenderId: "1010697707354");

  static Future<void> initFirebaseCore() async {
    try {
      FirebaseApp app = await Firebase.initializeApp();
      assert(app != null);
      print('Initialized default app $app');
    } catch (e) {
      print(
          "Catch in FirebaseCoreService.initFirebaseCore - message: ${e.message}");
    }
  }
}

