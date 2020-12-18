import 'package:FindHotel/configs/appcolor.dart';
import 'package:FindHotel/pages/tutorial/tutorial_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppTheme.primaryColor));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TutorialPage(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
