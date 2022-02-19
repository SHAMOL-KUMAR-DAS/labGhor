import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';

import 'confirm_booking.dart';

class Book_Doctor extends StatefulWidget {
  @override
  State<Book_Doctor> createState() => _Book_DoctorState();
}

class _Book_DoctorState extends State<Book_Doctor> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Book Doctor', style: TextStyle(fontWeight: FontWeight.bold),),
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
          Text("    Select a Date",style: TextStyle(fontWeight: FontWeight.bold),),
          Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Date selected",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "${dateTime?.day}-${dateTime?.month}-${dateTime?.year}",
                    style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              children: <Widget>[
                const SizedBox(height: 12),
                FloatingActionButton.extended(
                  backgroundColor: Colors.blue,
                  onPressed: () async {
                    DateTime? newDateTime = await showRoundedDatePicker(
                      context: context,
                      theme: ThemeData(primarySwatch: Colors.pink),
                    );
                    if (newDateTime != null) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                  label: Text("Select a Date From Calender"),
                ),
              ],
            ),
          ),
          Container(
              height: size.height*.22,
              width: size.width,
              margin: EdgeInsets.only(left: 15, right: 15,bottom: 8),
              child: Card(
                  shadowColor: colors,
                  elevation: 4,
                  //margin: EdgeInsets.only(top: 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Availability",style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("For Selected Date",style: TextStyle(fontSize: 12,color: Color(0xff78000000,)),),
                        SizedBox(height: MediaQuery.of(context).size.height*.01,),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,color: deepBlue),
                                    Text("9:00 AM")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,color: deepBlue,),
                                    Text("9:00 AM")
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,color: deepBlue),
                                    Text("9:00 AM")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,color: deepBlue),
                                    Text("9:00 AM")
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,color: deepBlue),
                                    Text("9:00 AM")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.access_time_outlined,color: deepBlue),
                                    Text("9:00 AM")
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
              )
          ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Confirm_Booking()));
                },
                child: const Text(
                  'Confirm Booking',
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