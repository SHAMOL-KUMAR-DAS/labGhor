import 'package:flutter/material.dart';
import 'package:online_doctor_booking/UI/TEST/menu_dashboard_layout.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Scaffold(
          backgroundColor: Color(0xffE5E5E5),
          body: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuDashboardPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height*.045,),
                  Text(
                    'My Profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: height*.09,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.55,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height*.05,
                                    ),
                                    Text(
                                      'Rosina Doe',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Nunito',
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Address: 43 Oxford Road\nM13 4GR\nManchester, UK")
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: height*.2,
                              right: 320,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: height*.018,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/img_2.png',
                                    width: innerWidth * 0.25,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width*1,
                    height: height*.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Edit profile",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
                      ],
                    ),
                  ),
                  SizedBox(height: height*.030,),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width*1,
                    height: height*.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Shopping Address",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
                      ],
                    ),
                  ),
                  SizedBox(height: height*.030,),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width*1,
                    height: height*.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order History",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
                      ],
                    ),
                  ),
                  SizedBox(height: height*.030,),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width*1,
                    height: height*.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cards",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
                      ],
                    ),
                  ),
                  SizedBox(height: height*.030,),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    width: width*1,
                    height: height*.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Notifications",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}