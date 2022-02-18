import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/UI/DIAGNOSIS/diagnostics.dart';
import 'package:online_doctor_booking/UI/DOCTOR/book_doctor.dart';
import 'package:online_doctor_booking/UI/SHOP/shop.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('LabGhor', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: const [
                Icon(Icons.notifications_none),
              ],
            ),
          )
        ],
      ),

      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CarouselSlider.builder(
              itemCount: Carousel().lists.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.14,
                  autoPlay: true,
                  autoPlayInterval: Duration(milliseconds: 2000),
                  viewportFraction: 0.45
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

          Row(
            children: [

              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 0,top: 15),
                  height: size.height * 0.32,
                  width: size.width * 0.45,
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
                        Image(image: AssetImage('assets/images/diagnosis.png'),height: size.height * 0.2,),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text('Diagnosis',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),

              Column(
                children: [

                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Shop()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 0, right: 0,top: 15),

                      height: size.height * 0.19,
                      width: size.width * 0.43,
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
                            Image(image: AssetImage('assets/images/shop.png'),height: size.height * 0.12,),
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
                      margin: EdgeInsets.only(left: 15, right: 15,top: 15),

                      height: size.height * 0.11,
                      width: size.width * 0.43,
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
                          Image(image: AssetImage('assets/images/remainder.png'),height: size.height * 0.05,),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
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
            height: MediaQuery.of(context).size.height * 0.1,
            child: ListView.builder(
              itemCount: Category().lists.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var data = Category().lists;
                return Card(
                  margin: EdgeInsets.only(left: 18.0, bottom: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.red,width: 2)
                    ),
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data[index].item_image,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                        //SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                        Flexible(
                          child: Text(data[index].item_name != null ? data[index].item_name : '',style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                        // SizedBox(height: 6.0),

                      ],
                    ),
                  ),
                );

              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 15, left: 25, right: 25,bottom: 0),
            child: Row(
              children: [
                Text("Suggestions", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
              ],
            ),
          ),

          const Divider(
            thickness: 2,
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
              child: GridView.builder(
                  itemCount: Category().lists.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
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
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Image(
                              image: AssetImage(data[index].item_image),
                              height: size.height * 0.05,
                            ),
                          ),
                          Flexible(child: Text(data[index].item_name, style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.center,))
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}