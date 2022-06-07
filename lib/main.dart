import 'package:buildathon_main/views/homescreen.dart';
import 'package:buildathon_main/views/location.dart';
import 'package:buildathon_main/views/mail.dart';
import 'package:buildathon_main/views/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/main': (context) => MainScreen(
              title: '',
            ),
        '/sentmail': (context) => SentMail(),
        '/location': (context) => Location(),
      },
      home: HomeScreen(),
    );
  }
}
