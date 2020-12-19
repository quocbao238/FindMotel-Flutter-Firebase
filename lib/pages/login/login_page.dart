import 'package:FindHotel/configs/appcolor.dart';
import 'package:FindHotel/configs/appsetting.dart';
import 'package:FindHotel/configs/sizeapp.dart';
import 'package:FindHotel/pages/register/register_page.dart';
import 'package:FindHotel/widget/custom_btn_widget.dart';
import 'package:FindHotel/widget/custom_image_widget.dart';
import 'package:FindHotel/widget/custom_text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../configs/appsetting.dart';
import '../../configs/sizeapp.dart';

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
    SizeApp.getSizeApp(context);
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: SizeApp.getHeight(1),
          child: Stack(
            children: [
              _clippath(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _clippath() {
    return ClipPath(
      child: Container(
        color: AppTheme.primaryColor,
      ),
      clipper: LoginClipPath(),
    );
  }

  Widget _body() {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.all(SizeApp.padding),
        child: Column(
          children: [
            // topImage(),
            MyImageSvgWidget(
                height: SizeApp.getHeight(0.32), urlSvg: AppSetting.loginSvg),
            SizedBox(height: SizeApp.getHeight(0.03)),
            MyButtonSquareCenterTextWidget(
                color: Colors.blue[900],urlIcon: AppSetting.googleImgIcon,
                title: 'Login with Google',
                onTap: () {}),
            _txtOr(),
            MyCustomTextFormFieldWithHeaderWidget(
                title: "Email", textEditingController: emailController),
            MyCustomTextFormFieldWithHeaderWidget(
                title: "Password",
                isPassword: true,
                textEditingController: passwordController),
            MyButtonSquareCenterTextWidget(
                color: Colors.red, title: 'Login', onTap: () {}),
            _btnsignup(onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            }),
          ],
        ),
      ),
    );
  }

  Widget _txtOr() {
    return Container(
      margin: EdgeInsets.only(
          top: 16.0, left: SizeApp.padding, right: SizeApp.padding),
      child: Row(
        children: [
          Expanded(child: Container(height: 1.0, color: Colors.black12)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: SizeApp.padding),
            child: Text('OR',
                style: AppTheme.styleHeaderText
                    .copyWith(fontWeight: FontWeight.normal)),
          ),
          Expanded(child: Container(height: 1.0, color: Colors.black12))
        ],
      ),
    );
  }

  Widget _btnsignup({Function onTap}) => InkWell(
        child: Container(
          margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Don't have an account? ", style: AppTheme.styleDefaultText),
              Text("Register now!!!",
                  style: AppTheme.styleDefaultPrimaryColorText),
            ],
          ),
        ),
        onTap: () => onTap(),
      );
}

class LoginClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  double heightNeed = 0.35;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * heightNeed);
    path.quadraticBezierTo(size.width * 0.05, size.height * (heightNeed + 0.05),
        size.width * 0.3, size.height * (heightNeed + 0.05));
    path.quadraticBezierTo(size.width * 0.3, size.height * (heightNeed + 0.05),
        size.width * 0.8, size.height * (heightNeed + 0.05));
    path.quadraticBezierTo(size.width * 0.95, size.height * (heightNeed + 0.05),
        size.width, size.height * (heightNeed + 0.1));
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
