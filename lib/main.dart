import 'package:flutter/material.dart';
import 'package:lanes/screens/test_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => RoutePlannerScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Roboto"),
    );
  }
}
