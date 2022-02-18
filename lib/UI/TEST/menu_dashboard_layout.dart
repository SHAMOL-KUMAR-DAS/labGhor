import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/UI/DIAGNOSIS/diagnostics.dart';
import 'package:online_doctor_booking/UI/DOCTOR/book_doctor.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/SHOP/shop.dart';

final Color backgroundColor =  const Color(0xFF6FC1F9);

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  var screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller!);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0)).animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation!,
      child: ScaleTransition(
        scale: _menuScaleAnimation!,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                Row(
                  children: const [
                    Icon(Icons.account_circle_outlined,color: Colors.white,size: 30,),
                    Text(" Profile", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                    color: Colors.white70,
                ),
                Row(
                  children: const [
                    Icon(Icons.add_shopping_cart,color: Colors.white,size: 30,),
                    Text(" My Orders", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.white70,
                ),
                Row(
                  children: const [
                    Icon(Icons.favorite_border,color: Colors.white,size: 30,),
                    Text(" Favorites", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.white70,
                ),
                Row(
                  children: const [
                    Icon(Icons.wallet_travel,color: Colors.white,size: 30,),
                    Text(" Delivery", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  color: Colors.white70,
                ),
                Row(
                  children: const [
                    Icon(Icons.settings,color: Colors.white,size: 30,),
                    Text(" Settings", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                SizedBox(height: 200),

                GestureDetector(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.logout,color: Colors.white,size: 30,),
                      Text(" Log out", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Material(
          animationDuration: duration,
          // borderRadius: const BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: const Color(0xffFFFFFF),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: appBarColor,
                    child: Padding(
                      padding: const EdgeInsets.only(left:15,right:15,top:28.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            child: const Icon(Icons.menu, color: Colors.white),
                            onTap: () {
                              setState(() {
                                if (isCollapsed)
                                  _controller!.forward();
                                else
                                  _controller!.reverse();

                                isCollapsed = !isCollapsed;
                              });
                            },
                          ),
                          const Text("LabGhor", style: TextStyle(fontSize: 24, color: Colors.white)),
                          const Icon(Icons.notifications_none,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: CarouselSlider.builder(
                      itemCount: Carousel().lists.length,
                      options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.14,
                          autoPlay: true,
                          autoPlayInterval: const Duration(milliseconds: 2000),
                          viewportFraction: 0.45
                        //reverse: true
                      ),
                      itemBuilder: (context, index, realIndex) {
                        var data = Carousel().lists;
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          color: const Color(0xFFf3f6fb),
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
                  Row(
                    children: [

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 15, right: 0,top: 15),
                          height: size.height * 0.32,
                          width: size.width * 0.44,
                          decoration: BoxDecoration(
                              color: backColors,
                              boxShadow: const [
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(image: const AssetImage('assets/images/diagnosis.png'),height: size.height * 0.2,),
                                const Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text('Diagnosis',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),

                      Column(
                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 0, right: 0,top: 15),

                              height: size.height * 0.19,
                              width: size.width * 0.415,
                              decoration: BoxDecoration(
                                  color: backColors,
                                  boxShadow: const [
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(image: const AssetImage('assets/images/shop.png'),height: size.height * 0.12,),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text('Shops',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => BookDoctor()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 15, right: 15,top: 15),

                              height: size.height * 0.11,
                              width: size.width * 0.415,
                              decoration: BoxDecoration(
                                  color: backColors,
                                  boxShadow: const [
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(image: const AssetImage('assets/images/remainder.png'),height: size.height * 0.05,),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text('Book a Doctor',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 25, right: 25,bottom: 0),
                    child: Row(
                      children: const [
                        Text("Offers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                        Spacer(),
                        Text("See All", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.13,
                    child: ListView.builder(
                      itemCount: Category().lists.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = Category().lists;
                        return Card(
                          margin: const EdgeInsets.only(left: 18.0, bottom: 2.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red,width: 2)
                            ),
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  data[index].item_image,
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                ),
                              ],
                            ),
                          ),
                        );

                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 25, right: 25,bottom: 0),
                    child: Row(
                      children: const [
                        Text("Suggestions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height:size.height * 0.15,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
                      child: GridView.builder(
                          itemCount: Category().lists.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 115,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 0,
                              crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int index){
                            var data = Category().lists;
                            return Card(
                              shadowColor: colors,
                              elevation: 4,
                              //margin: EdgeInsets.only(top: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2, bottom: 2,left: 2,right: 2),
                                    child: Image(
                                      image: AssetImage(data[index].item_image),
                                      height: size.height * 0.05,
                                    ),
                                  ),
                                  Flexible(child: Text(data[index].item_name, style: const TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.center,))
                                ],
                              ),
                            );
                          }),
                    ),
                  )



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}