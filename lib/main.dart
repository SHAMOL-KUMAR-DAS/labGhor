import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_doctor_booking/UI/HOME/home_page.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';
import 'package:online_doctor_booking/splash.dart';
import 'package:online_doctor_booking/test.dart';

import 'UI/SIGNUP/signup_page.dart';


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
      theme: ThemeData(
        textTheme: GoogleFonts.mcLarenTextTheme(
            Theme.of(context).textTheme
        ),
        primarySwatch: Colors.pink,
      ),
      //home: AnimatedSplashScreen(),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

