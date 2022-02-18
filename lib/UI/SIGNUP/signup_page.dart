import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/CONFIGURE/custom_text_field.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';

class SignUpScreen extends StatelessWidget {

  var fname      = TextEditingController();
  var lname      = TextEditingController();
  var mobile     = TextEditingController();
  var password   = TextEditingController();
  var rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6FC1F9),
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

      //resizeToAvoidBottomInset: false,


      body: SingleChildScrollView(
        child: Container(
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
                  controller: fname,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'last Name',
                  issecured: false,
                  controller: lname,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'Phone Number',
                  issecured: false,
                  controller: mobile,
                  maxLength: 11,
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
                  height: 25,
                ),
                CustomTextField(
                  hint: 'Re-enter Password',
                  issecured: true,
                  controller: rePassword,
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

                          (fname.text != '' && lname.text != '') && mobile.text != '' && mobile.text.startsWith('01') && mobile.text.length == 11 &&
                              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(password.text) && password.text == rePassword.text?
                          {
                            print('${fname.text} ${lname.text}'),
                            Register(context, name: '${fname.text} ${lname.text}', mobile: mobile.text, password: password.text),
                          }
                          :
                          {
                            fname.text == '' && lname.text == '' ?
                            {
                            showDialog(context: context, builder: (BuildContext context){
                            return const AlertDialog(
                            title: Text('Enter First Name or Last Name'),
                            );
                            })
                                }
                            :
                            !mobile.text.startsWith('01') || mobile.text.length != 11 ?
                            {
                              showDialog(context: context, builder: (BuildContext context){
                                return const AlertDialog(
                                  title: Text('Enter Valid Phone Number'),
                                );
                              })
                            }
                            :
                            !RegExp(r'^.{6,}$').hasMatch(password.text) ?
                            {
                              showDialog(context: context, builder: (BuildContext context){
                                return const AlertDialog(
                                  title: Text('Enter Password more than 5 Characters'),
                                );
                              })
                            }
                            :
                            !RegExp(r'^(?=.*?[A-Z])').hasMatch(password.text) ?
                            {
                            showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                            title: Text('Enter an Upper Case'),
                            );
                            })
                            }
                            :
                            !RegExp(r'^(?=.*?[a-z])').hasMatch(password.text) ?
                            {
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Enter an Lower Case'),
                                );
                              })
                            }
                            :
                            !RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(password.text) ?
                            {
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text('Enter an Special Character'),
                                );
                              })
                            }
                            :
                            password.text != rePassword.text ?
                            {showDialog(context: context, builder: (BuildContext context){
                              return const AlertDialog(
                                title: Text('Enter Same Password'),
                              );
                            })}
                            :
                            {}
                          };
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
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

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
      ),
    );
  }
}