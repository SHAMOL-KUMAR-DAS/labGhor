import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/MODEL/diagnostic.dart';
import 'package:online_doctor_booking/MODEL/login.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

//User Login(/user-login) - COMPLETE
Future Login(BuildContext context, {mobile, password}) async{
  var url = '$_baseUrl/user-login';
  var response = await http.post(Uri.parse(url), body: {
    'mobile'    : mobile,
    'password'  : password
  });
  if(response.statusCode == 200){
    LoginResponse loginData = loginResponseFromJson(response.body);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(loginData.mgs == 'Login Success' )
    {
      String token = await loginData.data.token;
      await prefs.setString('token', token);

      String user_id = await loginData.data.id.toString();
      await prefs.setString('user_id', user_id);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MenuDashboardPage()), (route) => false);
    }

    else
    {
      showDialog(context: context, builder: (BuildContext context){
        return AlertDialog(
          title: Text('Enter Valid Mobile and Password'),
        );
      });
    };
  }
}

//Profile (/user-info/user_id)
Future Profile() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = (prefs.getString('user_id') ?? '0');
  var token = (prefs.getString('token') ?? '0');

  var url = '$_baseUrl/user-info/$user_id';
  var response = await http.get(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  });
}

//Update Profile (/user-profile-update)
Future UpdateProfile({name, mobile, email, district, thana, full_address}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user_id = (prefs.getString('user_id') ?? '0');

  var url = '$_baseUrl/user-profile-update';
  var response = await http.post(Uri.parse(url), body: {
    'user_id'       : user_id,
    'mobile'        : mobile,
    'email'         : email,
    'district'      : district,
    'thana'         : thana,
    'full_address'  : full_address
  });
}

//Thana Wise Diagonstics(diagnostics-list-by-thana/ThanaName) - COMPLETE
Future Diagonstics({thanaName}) async{
  var url = '$_baseUrl/diagnostics-list-by-thana/$thanaName';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){
    ViewDiagnosticResponse diagnosticData = viewDiagnosticResponseFromJson(response.body);
    print(diagnosticData.data[0].id);
    return diagnosticData;
  }
}

//Test Category (/test-category/diagnosticsId)
Future TestCategory({diagnosticsId}) async{
  var url = '$_baseUrl/test-category/$diagnosticsId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){

  }
}

//Show Test List (/show-test-list/categoryName/diagnosticsId)
Future ShowTest({categoryName, diagnosticsId}) async{
  var url = '$_baseUrl/show-test-list/$categoryName/$diagnosticsId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){

  }
}

//Test Search (/search-test)
Future TestSearch({text, diagnosticId}) async{
  var url = '$_baseUrl/search-test';
  var response = await http.post(Uri.parse(url),body: {
    'search_text' : text,
    'diagnostic_id': diagnosticId
  });

  if(response.statusCode == 200){

  }
}

//Test Details (/test-details/diagnosticTestId)
Future TestDetails({diagnosticTestId}) async{
  var url = '$_baseUrl/test-details/$diagnosticTestId';
  var response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){

  }
}

//Test Order (test-order)
Future TestOrder({patientName, patientAddress, mobile, age, diagnosticTestId, paymentTx, paymentMethod}) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = (prefs.getString('token') ?? '0');
  var user_id = (prefs.getString('user_id') ?? '0');
  var url = '$_baseUrl/test-order';
  var response = await http.post(Uri.parse(url), headers: {
    'Authorization' : 'Bearer $token'
  }, body: {
    'user_id'               : user_id,
    'patient_name'          : patientName,
    'patient_address'       : patientAddress,
    'patient_contect_mobile': mobile,
    'patient_age'           : age,
    'd_test_id'             : diagnosticTestId,
    'payment_txn'           : paymentTx,
    'payment_method'        : paymentMethod,
  });
}