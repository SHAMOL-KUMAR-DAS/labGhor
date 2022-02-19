import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';

class Confirm_Booking extends StatefulWidget {
  @override
  State<Confirm_Booking> createState() => _Confirm_BookingState();
}

class _Confirm_BookingState extends State<Confirm_Booking> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Confirm Book', style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: const [
                Image(image: AssetImage("assets/images/img_3.png"),height: 30,),
              ],
            ),
          )
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: size.height*.12,
              margin: EdgeInsets.only(left: 15, right: 15, top: 8),
              child: Card(
                  shadowColor: colors,
                  elevation: 4,
                  //margin: EdgeInsets.only(top: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: appBarColor,
                        backgroundImage: AssetImage("assets/images/img_4.png"),
                      ),
                      title: Text('Dr. Juli', textAlign: TextAlign.start,),

                    ),
                  )
              )
          ),
          Container(
              height: size.height*.12,
              width: size.width,
              margin: EdgeInsets.only(left: 15, right: 15, top: 8,bottom: 8),
              child: Card(
                  shadowColor: colors,
                  elevation: 4,
                  //margin: EdgeInsets.only(top: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("  Consultation Fee",style: TextStyle(color: Color(0xff78000000)),),
                      Text("  100 BDT",style: TextStyle(color: deepBlue,fontSize: 18),),
                    ],
                  )
              )
          ),
          Text("    Date : 9/02/2022",style: TextStyle(fontWeight: FontWeight.bold),),
          Text("    Time : 9.00 AM",style: TextStyle(fontWeight: FontWeight.bold),),
          Image.asset("assets/images/img_5.png",),
        ],
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
                  'Download',
                  style:  TextStyle(color: Colors.white, fontSize: 18),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )),
        ),
      ),
    );
  }
}