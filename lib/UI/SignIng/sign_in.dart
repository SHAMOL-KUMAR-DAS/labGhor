import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/body.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var _phone = TextEditingController();
  var _pin = TextEditingController();

  showLoaderDialog(BuildContext context) {
    AlertDialog alert=AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){

        return alert;
      },
    );
  }

  var _hideText = true;

  viewPass(){
    setState(() {
      _hideText = !_hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColors,
      appBar: AppBar(
        //backgroundColor: backColors,
        elevation: 0,
        title: WavyAnimatedTextKit(
          textStyle: const TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.w400
          ),
          text: ["Stay with Login In"],
          isRepeatingAnimation: false,
        ),
        centerTitle: true,

      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            const Image(image: AssetImage('assets/images/sign_in.png'),height: 250,),

            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15),
              child: Column(
                children: [

                  //Phone No
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      autofillHints: [AutofillHints.telephoneNumber],
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          counter: Offstage(),
                          labelText: 'Phone No *',
                          hintText: 'Enter Your Phone No. *',
                          fillColor: Color(0xFFffffff),
                          filled: true,
                          labelStyle: TextStyle(fontSize: 16),
                          hintStyle: TextStyle(fontSize: 16),
                          prefixIcon: Icon(Icons.phone),
                          prefix: Visibility(
                              visible: true,
                              child: Text('+88 ',style: TextStyle(fontSize: 20),)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: colors,
                                width: 2
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: colors,
                              width: 2.0,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(top: 10, left: 20)
                      ),
                    ),
                  ),

                  //PIN
                  TextFormField(
                    controller: _pin,
                    keyboardType: TextInputType.number,
                    obscureText: _hideText,
                    maxLength: 4,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        counter: Offstage(),
                        labelText: 'PIN *',
                        hintText: 'Enter 4 Digits PIN *',
                        fillColor: Color(0xFFffffff),
                        filled: true,
                        labelStyle: TextStyle(fontSize: 16),
                        hintStyle: TextStyle(fontSize: 16),
                        prefixIcon: Icon(Icons.fiber_pin),
                        suffixIcon: InkWell(
                          onTap: viewPass,
                          child: _hideText? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: colors,
                              width: 2
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: colors,
                            width: 2.0,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(top: 10, left: 20)
                    ),
                  ),


                  //Login
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: FlatButton(
                        color: colors,
                        minWidth: MediaQuery.of(context).size.width ,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Body()), (route) => false);
                        },
                        child: Text('Login', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                        ),)),
                  ),

                  //don't have account
                  Text('Don\'t have an Account?'),

                  //Create Account
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 75),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: const Text('Create Account', style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),

                  //Developed by
                  //Text('Develop By Smart Software Ltd.')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}