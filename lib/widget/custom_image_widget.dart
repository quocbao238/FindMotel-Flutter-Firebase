import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyImageSvgWidget extends StatelessWidget {
  final String urlSvg;
  final double height;

  MyImageSvgWidget({this.urlSvg, this.height});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(child: SvgPicture.asset(urlSvg, height: height)),
    );
  }
}
