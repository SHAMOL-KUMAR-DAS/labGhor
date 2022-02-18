import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/MODEL/login.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';

var _baseUrl = 'https://labghorapi.bddaimond.com/api';

//User Registration(/user-reg) - COMPLETE
Future Register(BuildContext context, {name, mobile, password}) async{
  var url = '$_baseUrl/user-reg';
  var response = await http.post(Uri.parse(url), body: {
    'name'      : name,
    'mobile'    : mobile,
    'password'  : password
  });
  if(response.statusCode == 200){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }
}

//User Login(/user-login)
Future Login(BuildContext context, {mobile, password}) async{
  var url = '$_baseUrl/user-login';
  var response = await http.post(Uri.parse(url), body: {
    'mobile'    : mobile,
    'password'  : password
  });
  if(response.statusCode == 200){
    LoginResponse loginData = loginResponseFromJson(response.body);
    print(loginData.mgs);
    loginData.mgs == 'Login Success' ?
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MenuDashboardPage())) :
    {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Enter Valid Mobile and Password'),
        );
      })
    };
  }
}