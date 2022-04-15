import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class global{

  appSnackBar(BuildContext context, String message){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message, style: TextStyle(color: Colors.white),))
    );
  }
}