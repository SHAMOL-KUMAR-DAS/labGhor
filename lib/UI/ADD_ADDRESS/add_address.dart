import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';

class Add_Address extends StatefulWidget {
  const Add_Address({Key? key}) : super(key: key);

  @override
  _Add_AddressState createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text("Add a new Address"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Address()));
              },
              child: Container(
                padding: EdgeInsets.only(top: 10),
                height: size.height*.08,
                width: size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/img_1.png",width: size.width*.06,),
                    SizedBox(width: size.width*.02,),
                    Text("Use Current Location",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: deepBlue),),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your name',
                                  labelText: 'Name',
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter a phone number',
                                  labelText: 'Phone',
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your Street Address',
                                  labelText: 'Street Address',
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your City',
                                  labelText: 'City',
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter State',
                                  labelText: 'State',
                                ),
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your Zip Code',
                                  labelText: 'Zip Code',
                                ),
                              ),
    ],
    ),
    ),
            )

    ],
        ),
      ),
      bottomNavigationBar: Container(
        height: size.height*.1,
        width: size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 12.0,bottom: 12.0),
          child: ButtonTheme(
              buttonColor: deepBlue,
              minWidth: MediaQuery.of(context).size.width*.4,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                },
                child: const Text(
                  'Save',
                  style:  TextStyle(color: Colors.white, fontSize: 18),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)),
              )),
        ),
      ),
    );
  }
}
