import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const backgroundColor = Color(0xFFEBF2FA);
  static const alertColor = Color(0xff00bfa5);
  static const primaryColor = Color(0xFF6184D8);
  static const blue256 = Color.fromRGBO(44, 156, 162, 1);

  //Font size app

  // Header 20
  static const styleHeaderText =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
  // Default text 16
  static const styleDefaultText =
      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);
  static const styleDefaultPrimaryColorText = TextStyle(
      fontSize: 16.0,
      color: AppTheme.primaryColor,
      fontWeight: FontWeight.normal);
  // Subtext 14
  static const styleSubText =
      TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal);
  static const styleSubPrimaryColorText = TextStyle(
      fontSize: 14.0,
      color: AppTheme.primaryColor,
      fontWeight: FontWeight.normal);
}
