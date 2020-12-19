import 'package:flutter/material.dart';

import '../configs/appcolor.dart';
import '../configs/sizeapp.dart';

class MyCustomTextFormFieldWithHeaderWidget extends StatelessWidget {
  final String title;
  final bool isPassword;
  final TextEditingController textEditingController;

  const MyCustomTextFormFieldWithHeaderWidget({
    this.title,
    this.isPassword = false,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 16.0, left: SizeApp.padding, right: SizeApp.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTheme.styleDefaultText),
          Container(
            height: 46.0,
            margin: EdgeInsets.only(top: SizeApp.padding * 0.5),
            child: TextFormField(
              obscureText: isPassword ? true : false,
              controller: textEditingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.only(bottom: 6.0, left: 16.0, right: 16.0),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: AppTheme.styleDefaultText,
            ),
          )
        ],
      ),
    );
  }
}
