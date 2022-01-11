// import 'package:flutter/material.dart';
// import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
// import 'package:online_doctor_booking/UI/Appointments/appointment_body.dart';
// import 'package:online_doctor_booking/UI/Doctors/doctors_body.dart';
// import 'package:online_doctor_booking/UI/Medicine/medicine_body.dart';
// import 'package:online_doctor_booking/UI/More/more_body.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
//
// import 'Hospitals/hospital_body.dart';
//
//
// class Body extends StatefulWidget {
//
//   @override
//   _BodyState createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//
//   int _currentIndex = 0;
//
//   final _page1 = GlobalKey<NavigatorState>();
//   final _page2 = GlobalKey<NavigatorState>();
//   final _page3 = GlobalKey<NavigatorState>();
//   final _page4 = GlobalKey<NavigatorState>();
//   final _page5 = GlobalKey<NavigatorState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(
//         index: _currentIndex,
//         children: <Widget>[
//
//           Navigator(
//             key: _page1,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => MedicineBody(),
//             ),
//           ),
//
//           Navigator(
//             key: _page2,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => DoctorsBody(),
//             ),
//           ),
//
//           Navigator(
//             key: _page3,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => HospitalBody(),
//             ),
//           ),
//
//           Navigator(
//             key: _page4,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => AppontmentBody(),
//             ),
//           ),
//
//           Navigator(
//             key: _page5,
//             onGenerateRoute: (route) => MaterialPageRoute(
//               settings: route,
//               builder: (context) => MoreBody(),
//             ),
//           ),
//
//
//         ],
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         clipBehavior: Clip.antiAlias,
//         child: SalomonBottomBar(
//           currentIndex: _currentIndex,
//           onTap: (int index){
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: [
//             //Home
//             SalomonBottomBarItem(
//               icon: ImageIcon(AssetImage('assets/images/medicine.png')),
//               title: Text("Medicine",style: bodyStyle,),
//               selectedColor: colors,
//             ),
//
//             //DashBoard
//             SalomonBottomBarItem(
//               icon: Icon(Icons.dashboard),
//               title: Text("Doctors",style: bodyStyle,),
//               selectedColor: colors,
//             ),
//
//             //Cash
//             SalomonBottomBarItem(
//               icon: Icon(Icons.local_hospital_outlined),
//               title: Text("Hospitals",style: bodyStyle,),
//               selectedColor: colors,
//             ),
//
//             //Profile
//             SalomonBottomBarItem(
//               icon: Icon(Icons.person_outline),
//               title: Text("Appointments",style: bodyStyle,),
//               selectedColor: colors,
//             ),
//
//             SalomonBottomBarItem(
//               icon: Icon(Icons.more_outlined),
//               title: Text("More",style: bodyStyle,),
//               selectedColor: colors,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel.dart';

import 'drawer_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColors,
        //leading: IconButton(
          // icon: Icon(Icons.menu, color: Colors.red), // set your color here
          // onPressed: () {
          //
          // },
        //),
        iconTheme: IconThemeData(color: colors),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Location',style: TextStyle(color: colors,fontWeight: FontWeight.w600),),
            Text('Location',style: TextStyle(color: Colors.black54,fontSize: 16),)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart_outlined,color: colors,),
          )
        ],
        elevation: 0,
      ),

      drawer: DrawerPage(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //Search
            Container(
              color: backColors,
              height: size.height * 0.058,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Color(0xFFdbdbdb),
                    filled: true,
                    hintText:
                    'Search for shops & restaurants',
                    prefixIcon: Icon(Icons.person_search),
                    // border: new OutlineInputBorder(
                    //     borderSide: new BorderSide(color: Colors.teal),
                    //     borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFFdbdbdb), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color(0xFFdbdbdb),
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 10, left: 20,bottom: 10),
                  ),
                ),
              ),
            ),

            //Carousel Slider
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CarouselSlider.builder(
                itemCount: Carousel().lists.length,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.2,
                    autoPlay: true,
                    autoPlayInterval: Duration(milliseconds: 2000),
                    viewportFraction: 0.65
                  //reverse: true
                ),
                itemBuilder: (context, index, realIndex) {
                  var data = Carousel().lists;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    color: Color(0xFFf3f6fb),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: AssetImage(data[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            //Diagnosis + Shops + Medicine Remainder
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 8,top: 15),

                  height: size.height * 0.35,
                  width: size.width * 0.43,
                  decoration: BoxDecoration(
                    color: Color(0xFFfed271),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Image(image: AssetImage('assets/images/diagnosis.png'),height: 150,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,right: 45, bottom: 15),
                        child: Text('Diagnosis',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text('All Kind of Diagonis Center',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      )
                    ],
                  ),
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15,top: 15),

                      height: size.height * 0.23,
                      width: size.width * 0.43,
                      decoration: BoxDecoration(
                          color: Color(0xFF84c0ff),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40,top: 5),
                            child: Image(image: AssetImage('assets/images/shop.png'),height: 100,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0,right: 85, bottom: 5),
                            child: Text('Shops',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('All Kind of shops Center',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 15,top: 15),

                      height: size.height * 0.1,
                      width: size.width * 0.43,
                      decoration: BoxDecoration(
                          color: Color(0xFFef9fc4),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 120,top: 5),
                            child: Image(image: AssetImage('assets/images/remainder.png'),height: 25,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10, bottom: 5,top: 0),
                            child: Text('Medicine Remainder',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
