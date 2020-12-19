import 'package:FindHotel/pages/login/login_page.dart';
import 'package:FindHotel/widget/custom_btn_widget.dart';
import 'package:FindHotel/widget/custom_image_widget.dart';
import 'package:FindHotel/widget/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/appcolor.dart';
import '../../configs/appsetting.dart';
import '../../configs/appsetting.dart';
import '../../configs/sizeapp.dart';
import '../../configs/sizeapp.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeApp.getSizeApp(context);
    return Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: SizeApp.getHeight(1),
            child: Stack(
              children: [
                clipPath(),
                Positioned.fill(
                    child: Column(
                  children: [
                    MyImageSvgWidget(
                        height: SizeApp.getHeight(0.35),
                        urlSvg: AppSetting.registerSvg),
                    MyCustomTextFormFieldWithHeaderWidget(
                        title: "User Name",
                        textEditingController: userController),
                    MyCustomTextFormFieldWithHeaderWidget(
                      title: "Email",
                      textEditingController: emailController,
                    ),
                    MyCustomTextFormFieldWithHeaderWidget(
                      title: "Password",
                      isPassword: true,
                      textEditingController: passwordController,
                    ),
                    MyButtonSquareCenterTextWidget(
                      title: "Register",
                      onTap: () {},
                    ),
                    _btnLogin(onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
                  ],
                ))
              ],
            ),
          ),
        ));
  }

  Widget _btnLogin({Function onTap}) => InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Already have an account? ",
                  style: AppTheme.styleDefaultText),
              Text("Login now!!!",
                  style: AppTheme.styleDefaultPrimaryColorText),
            ],
          ),
        ),
        onTap: () => onTap(),
      );

  Widget clipPath() {
    return Positioned.fill(
        child: Container(
      height: SizeApp.getHeight(0.9),
      child: ClipPath(
        child: Container(color: AppTheme.primaryColor),
        clipper: RegisterClipPath(),
      ),
    ));
  }
}

class RegisterClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.2);
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.3,
        size.width * 0.5, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.8, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
