import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hint;
  bool issecured;
  var controller, maxLength, keyboardType;

  CustomTextField({Key? key, required this.hint, required this.issecured, this.controller, this.maxLength, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: TextField(obscureText: issecured,
          controller: controller,
          cursorColor: Colors.white,
          keyboardType: keyboardType ?? null,
          style: const TextStyle(color: Colors.white),
          maxLength: maxLength,
          decoration: InputDecoration(
            counter: Offstage(),
            contentPadding: EdgeInsets.only(left: 25.0),

              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500),
              filled: true,
              hoverColor: Colors.white,
              focusColor: Colors.white,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(35),
              )),
        ));
  }
}