import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/UI/DOCTOR/book_doctor.dart';
import 'package:online_doctor_booking/UI/PAGE/page_five.dart';
import 'package:online_doctor_booking/UI/TEST/test_list.dart';

class Diagnosis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Diagnostics', style: TextStyle(fontWeight: FontWeight.bold),),
        //centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PageFive()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: const [
                  Icon(Icons.notifications_none),
                ],
              ),
            ),
          )
        ],
      ),

      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Slider
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: CarouselSlider.builder(
              itemCount: Carousel().lists.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.16,
                  autoPlay: true,
                  autoPlayInterval: Duration(milliseconds: 2000),
                  viewportFraction: 0.54
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

           Text('Services',textAlign: TextAlign.start,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),

          Row(
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookDoctor()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 0,top: 15),
                  height: size.height * 0.2,
                  width: size.width * 0.43,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/diagnosis.png'),height: size.height * 0.12,),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('BOOK A DOCTOR',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),

                    ],
                  ),
                ),
              ),
              Spacer(),

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TestList()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 0, right: 15,top: 15),
                  height: size.height * 0.2,
                  width: size.width * 0.43,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(image: AssetImage('assets/images/diagnosis.png'),height: size.height * 0.12,),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('TEST',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text('Health Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
              child: GridView.builder(
                  itemCount: Category().lists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 80,
                      mainAxisSpacing: 0,
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
                        child: Center(
                          child: ListTile(
                              leading: Text(data[index].item_name, textAlign: TextAlign.center,),
                              //title: Text('//'),
                              trailing: CircleAvatar(
                                radius: 25,
                                backgroundColor: appBarColor,
                                backgroundImage: AssetImage(data[index].item_image),
                              )
                          ),
                        )
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
