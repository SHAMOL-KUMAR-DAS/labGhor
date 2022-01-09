import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/Appointments/appointment_body.dart';
import 'package:online_doctor_booking/UI/Doctors/doctors_body.dart';
import 'package:online_doctor_booking/UI/Medicine/medicine_body.dart';
import 'package:online_doctor_booking/UI/More/more_body.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Hospitals/hospital_body.dart';


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int _currentIndex = 0;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();
  final _page4 = GlobalKey<NavigatorState>();
  final _page5 = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[

          Navigator(
            key: _page1,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => MedicineBody(),
            ),
          ),

          Navigator(
            key: _page2,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => DoctorsBody(),
            ),
          ),

          Navigator(
            key: _page3,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => HospitalBody(),
            ),
          ),

          Navigator(
            key: _page4,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => AppontmentBody(),
            ),
          ),

          Navigator(
            key: _page5,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => MoreBody(),
            ),
          ),


        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            //Home
            SalomonBottomBarItem(
              icon: ImageIcon(AssetImage('assets/images/medicine.png')),
              title: Text("Medicine",style: bodyStyle,),
              selectedColor: colors,
            ),

            //DashBoard
            SalomonBottomBarItem(
              icon: Icon(Icons.dashboard),
              title: Text("Doctors",style: bodyStyle,),
              selectedColor: colors,
            ),

            //Cash
            SalomonBottomBarItem(
              icon: Icon(Icons.local_hospital_outlined),
              title: Text("Hospitals",style: bodyStyle,),
              selectedColor: colors,
            ),

            //Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person_outline),
              title: Text("Appointments",style: bodyStyle,),
              selectedColor: colors,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.more_outlined),
              title: Text("More",style: bodyStyle,),
              selectedColor: colors,
            ),
          ],
        ),
      ),
    );
  }
}