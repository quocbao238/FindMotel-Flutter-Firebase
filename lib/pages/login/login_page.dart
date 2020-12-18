import 'package:FindHotel/configs/appcolor.dart';
import 'package:FindHotel/configs/appsetting.dart';
import 'package:FindHotel/configs/sizeapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(SizeApp.padding),
        child: Column(
          children: [
            topImage(),
            textformfield(
                title: "Email",
                textEditingController: emailController,
                keyboardType: TextInputType.emailAddress),
            textformfield(
                title: "Password",
                textEditingController: passwordController,
                keyboardType: TextInputType.text),
          ],
        ),
      ),
    );
  }

  Widget textformfield(
      {String title,
      TextEditingController textEditingController,
      TextInputType keyboardType}) {
    return Container(
      // height: 82.0,
      margin: EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTheme.styleDefaultText),
          Container(
            margin: EdgeInsets.only(top: SizeApp.padding * 0.5),
            child: TextFormField(
              // obscureText: isShowPassword,
              controller: textEditingController,
              decoration: InputDecoration(
                // suffixIcon: title == "Password"
                //     ? IconButton(
                //         icon: Icon(Icons.remove_red_eye),
                //         onPressed: () {},
                //       )
                //     : null,
                fillColor: Colors.white,
                filled: true,
                // contentPadding:
                // EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.primaryColor),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              keyboardType: keyboardType,
              style: AppTheme.styleDefaultText,
            ),
          )
        ],
      ),
    );
  }

  Widget topImage() => SafeArea(
        child: Container(
            child: SvgPicture.asset(
          AppSetting.loginSvg,
          height: SizeApp.getHeight(0.3),
        )),
      );
}
