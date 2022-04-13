import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/custom_text_field.dart';
import 'package:online_doctor_booking/CONFIGURE/loader_config.dart';
import 'package:online_doctor_booking/UI/SIGNUP/signup_page.dart';

class LoginScreen extends StatelessWidget {

  var dTestId, product, price, total, item;
  LoginScreen({this.dTestId, this.product, this.price, this.total, this.item});

  var mobile   = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xff6FC1F9),
        centerTitle: true,
        // automaticallyImplyLeading: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
              colors: [Color(0xff6FC1F9), Color(0xff6FC1F9)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text(
                'Welcome to LabGhor',
                style:   TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Login to your account',
                style:   TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 40,
              ),

              CustomTextField(
                hint: 'Mobile Number',
                issecured: false,
                controller: mobile,
                maxLength: 11,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hint: 'Password',
                issecured: true,
                controller: password,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25,bottom: 15),
                child: ButtonTheme(
                    buttonColor: Colors.white,
                    minWidth: MediaQuery.of(context).size.width,
                    height: 45,
                    child: RaisedButton(
                      onPressed: () {
                        Loader().showLoaderDialog(context, text: 'Loading');
                        Login(context, mobile: mobile.text, password: password.text, dTestId: dTestId,
                        product: product, price: price, productId: dTestId, total: total, item: item);
                      },
                      child: const Text(
                        'Login',
                        style:  TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    )),
              ),
              const Text(
                'Forgot your password ?',
                style:  TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account ? ',
                    style:  TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));

                    },
                    child: const Text(
                      'Sign up',
                      style:  TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}