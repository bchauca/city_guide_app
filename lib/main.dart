import 'package:city_guide_app/app_screens/login.dart';
import 'package:city_guide_app/app_screens/start.dart';
import 'package:city_guide_app/app_screens/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark
    ));
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Guide App',
      home: StartScreen(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'Lato'
      ),
      routes: <String, WidgetBuilder>{
        '/start': (BuildContext context) => new StartScreen(),
        '/login': (BuildContext context) => new LoginScreen(),
        '/main': (BuildContext context) => new MainScreen()
      },
    ); 
  }
}