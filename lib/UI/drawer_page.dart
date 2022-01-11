import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';

class DrawerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.78,
      child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: colors,
                  //color: backColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(image: AssetImage('assets/images/medicine.png'),height: 105,color: Colors.white,),
                    Text('Welcome to Design',style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
                  ],
                ),
              ),

              //Home
              ListTile(
                title: const Text('Home',style: TextStyle(fontSize: 14),),
                leading: Icon(Icons.home_outlined),
                onTap: () {
                },
              ),

              //Business Profile
              ListTile(
                title: const Text('Business Profile'),
                leading: Icon(Icons.person_outline),
                onTap: () {
                },
              ),

              //Reports
              ListTile(
                title: const Text('Reports'),
                leading: Icon(Icons.report_outlined),
                onTap: () {
                },
              ),

              //Package
              ListTile(
                title: const Text('Package'),
                leading: Icon(Icons.more_outlined ),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfile()));
                },
              ),

              //User Management
              ListTile(
                title: const Text('User Management'),
                leading: Icon(Icons.supervisor_account),
                onTap: () {
                },
              ),

              //Staff Management
              ListTile(
                title: const Text('Staff Management'),
                leading: Icon(Icons.workspaces_outline),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Change Language
              ListTile(
                title: const Text('Change Language'),
                leading: Icon(Icons.language_outlined),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Terms & Conditions
              ListTile(
                title: const Text('Terms & Conditions'),
                leading: Icon(Icons.admin_panel_settings),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Share
              ListTile(
                title: const Text('Share'),
                leading: Icon(Icons.share),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Rate us
              ListTile(
                title: const Text('Rate Us'),
                leading: Icon(Icons.star_rate_outlined),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Contact Us
              ListTile(
                title: const Text('Contact Us'),
                leading: Icon(Icons.contact_page_outlined),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Change PIN
              ListTile(
                title: const Text('Change PIN'),
                leading: Icon(Icons.lock_outline),
                onTap: () {
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Profile()), (route) => true);
                },
              ),

              //Log Out
              ListTile(
                title: const Text('Log Out'),
                leading: Icon(Icons.logout_outlined),
                onTap: () {

                },
              ),
            ],
          )
      ),
    );
  }
}