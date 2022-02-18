import 'package:flutter/material.dart';

class Loader{
  showLoaderDialog(BuildContext context,{text}) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text(text)),
        ],),
    );
    showDialog(barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}