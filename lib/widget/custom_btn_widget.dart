import 'package:flutter/material.dart';
import '../configs/appcolor.dart';
import '../configs/appsetting.dart';
import '../configs/sizeapp.dart';

class MyButtonSquareCenterTextWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function onTap;
  final String urlIcon;

  MyButtonSquareCenterTextWidget(
      {this.title, this.color = Colors.red, this.onTap, this.urlIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: SizeApp.padding * 2,
          left: SizeApp.padding,
          right: SizeApp.padding),
      child: RaisedButton(
        onPressed: () => onTap(),
        padding: EdgeInsets.all(SizeApp.padding),
        color: color,
        child: Row(
          mainAxisAlignment: urlIcon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (urlIcon != null)
              Container(child: Image.asset(urlIcon, height: 20.0)),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTheme.styleHeaderText.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
