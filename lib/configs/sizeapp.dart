import 'package:flutter/cupertino.dart';

class SizeApp {
  SizeApp._();
  static double height;
  static double width;
  static double statusBar;
  static double padding;

  static void getSizeApp(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    statusBar = MediaQuery.of(context).padding.top;

    // I use padding all in ap = 10dx, We call SizeApp.padding
    padding = 10;
    print(
        "SizeApp\nWidth = $width --- Height = $height --- Padding = $padding");
  }

  static double getWidth(double ratio) {
    return width * (ratio ?? 1);
  }

  static double getHeight(double ratio) {
    return height * (ratio ?? 1);
  }
}
