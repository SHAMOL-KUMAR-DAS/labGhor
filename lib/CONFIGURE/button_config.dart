import 'package:flutter/material.dart';

import 'color_config.dart';


class ButtonConfig extends StatelessWidget {
  var text;
  var press;


  ButtonConfig.FlatButton({
    this.text,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    return newFlatButton(context);
  }

  Widget newFlatButton(context) {
    Size size = MediaQuery.of(context).size;
    return FlatButton(
      minWidth: size.width,
      color: colors,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
        text,
        style: buttonText,
      ),
      onPressed: press,
    );
  }
}