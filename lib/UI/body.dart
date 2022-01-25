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
import 'package:online_doctor_booking/MODEL/blogs.dart';
import 'package:online_doctor_booking/MODEL/carousel.dart';
import 'package:online_doctor_booking/UI/Diagnosis/diagnosis_category.dart';
import 'package:online_doctor_booking/UI/Shops/shop_category.dart';
import 'Shops/shop_sub_category.dart';
import 'diagnosis/sub_category.dart';
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
        title: Text('LabGhor',style: TextStyle(color: colors,fontWeight: FontWeight.w600),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_cart_outlined,color: colors,),
          )
        ],
        elevation: 2,
      ),

      drawer: DrawerPage(),

      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DiagonisCategory()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 0,top: 15),
                      height: size.height * 0.35,
                      width: size.width * 0.43,
                      decoration: BoxDecoration(
                        color: Color(0xFF9ae471),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              //offset: Offset(2.0, 2.0), // shadow direction: bottom right
                              offset: Offset(0.0, 3.0)
                            )
                          ],

                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Image(image: AssetImage('assets/images/diagnosis.png'),height: size.height * 0.23,),
                            ),
                            Text('Diagnosis',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                            Text('All Kind of Diagonis Center',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                          ],
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 0, right: 0,top: 15),

                          height: size.height * 0.23,
                          width: size.width * 0.43,
                          decoration: BoxDecoration(
                              color: Color(0xFF98e4fe),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                    //offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                    offset: Offset(2.0, 2.0)
                                )
                              ],
                              borderRadius: BorderRadius.circular(8)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 50,top: 5),
                                  child: Image(image: AssetImage('assets/images/shop.png'),height: size.height * 0.12,),
                                ),
                                Text('Shops',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                Text('All Kind of shops Center',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15,top: 15),

                        height: size.height * 0.1,
                        width: size.width * 0.43,
                        decoration: BoxDecoration(
                            color: Color(0xFFef9fc4),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                  //offset: Offset(2.0, 2.0), // shadow direction: bottom right
                                  offset: Offset(2.0, 2.0)
                              )
                            ],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 120,top: 5),
                              child: Image(image: AssetImage('assets/images/remainder.png'),height: size.height * 0.05,),
                            ),
                            Text('Book a Doctor',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),

              //Blogs
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 20),
                child: Text('Favourites',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
              ),

              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: Blogs().lists.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = Blogs().lists;
                    return GestureDetector(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => BlogsDetails(snapshot.data[index].id.toString())));
                        },
                        child:Card(
                          // color: index % 6 == 0 ? colorOne : index % 5 == 0 ? colorFive : index % 4 == 0 ? colorFour :
                          // index % 3 == 0 ? colorSix : index % 2 == 0 ? colorTwo : index % 1 == 0 ? colorThree : backColors,
                          shadowColor: colors,
                          elevation: 5,
                          margin: EdgeInsets.only(left: 18.0, bottom: 2.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red,width: 2)
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.only(top: 10,left: 10,right: 10, bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  data[index].image,
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height * 0.12,
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                                Flexible(
                                  child: Text(data[index].title != null ? data[index].title : '',style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600
                                  ),),
                                ),
                                // SizedBox(height: 6.0),

                              ],
                            ),
                          ),
                        )
                    );

                  },
                ),
              ),

            ],
          ),
      ),
    );
  }
}
