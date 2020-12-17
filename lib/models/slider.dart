import 'package:FindHotel/configs/appsetting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';

class SliderApp {
  static String title = "";
  static TextStyle styleTitle = TextStyle(
      color: Color(0xff3da4ab),
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoMono');
  static TextStyle styleDescripton = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'RobotoMono');

  static List<Slide> slidelst = [
    Slide(
      title: "",
      description:
          "Greet, register, and assign rooms to guests of hotels or motel",
      pathImage: AppSetting.slider1,
      styleDescription: styleDescripton,
      styleTitle: styleTitle,
    ),
    Slide(
      title: "",
      description:
          "Keep records of room availability and guests' accounts, manually or using computers",
      pathImage: AppSetting.slider2,
      styleDescription: styleDescripton,
      styleTitle: styleTitle,
    ),
    Slide(
      title: "",
      description:
          "Review accounts and charges with guests during the check out process",
      pathImage: AppSetting.slider3,
      styleDescription: styleDescripton,
      styleTitle: styleTitle,
    ),
    Slide(
      title: "",
      description: "Arrange tours, taxis, and restaurants for customers",
      pathImage: AppSetting.slider4,
      styleDescription: styleDescripton,
      styleTitle: styleTitle,
    ),
  ];
}
