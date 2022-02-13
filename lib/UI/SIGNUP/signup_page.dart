import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/CONFIGURE/custom_text_field.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
               'Welcome to LabGhur',
               style:   TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20),
                  ),
              const SizedBox(
                height: 60,
              ),
              const Text(
               'SignUp to your account',
               style:   TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.normal,
                   fontSize: 16),
                  ),
              const SizedBox(
                height: 10,
              ),

              CustomTextField(
                hint: 'First Name',
                issecured: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hint: 'last Name',
                issecured: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hint: 'Email Id/Phone Number',
                issecured: false,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hint: 'Password',
                issecured: true,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                hint: 'Re-enter Password',
                issecured: true,
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuDashboardPage()));
                      },
                      child: const Text(
                        'Create',
                        style:  TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text(
                    'Have an account ? ',
                    style:  TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                   GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

                     },
                     child: const Text(
                      'Sign in',
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