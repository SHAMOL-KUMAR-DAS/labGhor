import 'dart:async';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(milliseconds: 1800);
    return new Timer(_duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuDashboardPage()), (route) => false);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/images/splash.png',),
                width : animation.value * 650,
                height: animation.value * 650,
              ),
              Text('L a b G h o r',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
            ],
          ),
        ],
      ),
    );
  }
}