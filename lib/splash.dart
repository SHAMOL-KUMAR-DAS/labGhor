import 'dart:async';
import 'package:flutter/material.dart';


class AnimatedSplashScreen extends StatefulWidget {
  @override
  _AnimatedSplashScreenState createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  // var _visible = true;
  // var _userId;


  startTime() async {
    var _duration = new Duration(milliseconds: 3000);
    return new Timer(_duration, _loadUserInfo);
  }

  _loadUserInfo() async {
    // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn()), (route) => false);
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
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //
          //     // Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('assets/powered_by.png',height: 25.0,fit: BoxFit.scaleDown,))
          //     Padding(padding: EdgeInsets.only(bottom: 30.0),child:Text("Powered By Smart Software Ltd")),
          //
          //   ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/images/splash.png',),
                width: animation.value * 250,
                height: animation.value * 250,
              ),
              Text('L a b G h o r',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),),
            ],
          ),
        ],
      ),
    );
  }
}