import 'package:FirebaseDemo/models/employer.dart';
import 'package:FirebaseDemo/services/firebase_auth_service.dart';
import 'package:FirebaseDemo/services/firebase_core_service.dart';
import 'package:FirebaseDemo/services/api_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseCoreService.initFirebaseCore();
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  User user;
  Employer employer;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    // user = await FirebaseAuthService.loginWithEmail();
    user = FirebaseAuthService.checkUserLogged();
    if (user != null) {
      print(user);
      employer = await Api.getUserInfo(user.uid);
    } else {
      user = await FirebaseAuthService.loginWithGoogle();
      Employer _employer = Employer(
          address: "99 Le Van Viet, Thu Duc, Ho Chi Minh",
          email: "email",
          avatarUrl: "avatarUrl....",
          uid: user.uid,
          username: "BiAce");
      await Api.updateUserInfo(_employer, user.uid);
      employer = await Api.getUserInfo(user.uid);
      print(user);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: user != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (user.displayName != null) Text(user?.displayName ?? ""),
                    Text(user?.email ?? ""),
                    if (user.photoURL != null)
                      Image.network(user?.photoURL ?? ""),
                    if (employer != null) Text(employer.toJson().toString()),
                  ],
                )
              : Text('Not logged'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //SignOut;
          FirebaseAuthService.signOut();
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
