import 'package:coronavirus/service_locator.dart';
import 'package:coronavirus/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

setStatusBarColor() async {
  await FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
    );
  }
}
