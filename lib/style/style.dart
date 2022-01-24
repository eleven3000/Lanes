import 'package:flutter/material.dart';

Color lightOrange = Color(0xFFEE9B00);
Color orange = Color(0xFFCA6702);
Color darkOrange = Color(0xFFBB3E03);
Color red = Color(0xFFAE2012);
Color lightBlue = Color(0xFF00B4E0);
Color blue = Color(0xFF005F73);
Color eBlack = Color(0xFF1B1B1B);
Color lightGrey = Colors.grey[300]!;
Color darkGrey = Color(0xFF5C5C5C);
Color white = Colors.white;

TextStyle defaultLightGrey =
    TextStyle(color: lightGrey, fontSize: 14, fontFamily: "Roboto");
TextStyle defaultDarkGrey =
    TextStyle(color: darkGrey, fontSize: 14, fontFamily: "Roboto");
TextStyle defaultWhite =
    TextStyle(color: white, fontSize: 14, fontFamily: "Roboto");
TextStyle defaultBlack =
    TextStyle(color: eBlack, fontSize: 14, fontFamily: "Roboto");
TextStyle defaultBlue =
    TextStyle(color: lightBlue, fontSize: 14, fontFamily: "Roboto");
TextStyle largeLightGrey =
    TextStyle(color: lightGrey, fontSize: 18, fontFamily: "Roboto");
TextStyle largeDarkGrey =
    TextStyle(color: darkGrey, fontSize: 18, fontFamily: "Roboto");
TextStyle largeWhite =
    TextStyle(color: white, fontSize: 18, fontFamily: "Roboto");
TextStyle largeBlack =
    TextStyle(color: eBlack, fontSize: 18, fontFamily: "Roboto");
TextStyle headlineDarkGrey =
    TextStyle(color: darkGrey, fontSize: 40, fontFamily: "Roboto");

ButtonStyle orangeButtonRoundedStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(lightOrange),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: lightOrange))));

ButtonStyle blueButtonRoundedStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(lightBlue),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(color: lightBlue))));
