import 'package:FindHotel/configs/appcolor.dart';
import 'package:FindHotel/configs/sizeapp.dart';
import 'package:FindHotel/models/slider.dart';
import 'package:FindHotel/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  //Desgin customTab
  List<Widget> renderListCustomTabs() => SliderApp.slidelst
      .map((item) => Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  // The same padding left 10dp,right 10dp,top 20dp
                  margin: EdgeInsets.only(
                      left: SizeApp.padding,
                      right: SizeApp.padding,
                      top: SizeApp.padding * 2),
                  child: Image.asset(
                    item.pathImage,
                    height: 300.0,
                    width: 300.0,
                  ),
                ),
                //Content
                Container(
                  // i need padding left,right and top
                  margin: EdgeInsets.only(
                      left: SizeApp.padding,
                      right: SizeApp.padding,
                      top: SizeApp.padding * 2),
                  child: Text(
                    item.description,
                    style: item.styleDescription,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ))
      .toList();

  void onDonePress() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => LoginPage())));
  }

  Widget renderSkipBtn() {
    // You can change color text SKIP in here,
    // I use my custom color in appcolor
    return Text('SKIP', style: TextStyle(color: AppTheme.blue256));
  }

  Widget renderNextBtn() {
    // You can use Text "Next" or Icon...
    // return Text('NEXT', style: TextStyle(color: AppColor.blue256));
    return Icon(Icons.navigate_next, color: AppTheme.blue256, size: 35.0);
  }

  Widget renderDoneBtn() {
    return Icon(Icons.done, color: AppTheme.blue256);
  }

  @override
  Widget build(BuildContext context) {
    SizeApp.getSizeApp(context);
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: IntroSlider(
        // We use slides i create in models - slider.dart
        slides: SliderApp.slidelst,
        backgroundColorAllSlides: AppTheme.primaryColor,
        listCustomTabs: this.renderListCustomTabs(),
        //SKIP
        renderSkipBtn: this.renderSkipBtn(),
        colorSkipBtn: AppTheme.backgroundColor,
        highlightColorSkipBtn: Colors.black,

        // Next color is same..
        // Next button
        renderNextBtn: this.renderNextBtn(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        colorDoneBtn: AppTheme.backgroundColor,
        highlightColorDoneBtn: Colors.black,

        // Custom color indicator..
        // I use color dot ~ color grey and activedot is primaryColor
        // Oop... i think use color blue256
        colorDot: AppTheme.backgroundColor,
        colorActiveDot: AppTheme.blue256,
        sizeDot: 13.0,
      ),
    );
  }
}
