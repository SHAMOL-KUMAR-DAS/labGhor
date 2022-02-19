import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/sub_category_p.dart';
import 'package:online_doctor_booking/UI/DOCTOR/book_doctor.dart';
import 'package:online_doctor_booking/UI/DOCTOR/search_doctors.dart';

class Doctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Doctors', style: TextStyle(fontWeight: FontWeight.bold),),
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

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchDoctor()));
            },
            child: Container(
              height: size.height * 0.06,
              width: size.width,
              margin: EdgeInsets.only(bottom: 12,left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Color(0xFFdbdbdb),
                      width: 2
                  )
              ),
              child: Row(
                children: const[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search),
                  ),
                  Text('    Search')
                ],
              ),
            ),
          ),

          Text('     SELECT A DOCTOR'),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 8),
              child: GridView.builder(
                  itemCount: SubCategory().lists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 80,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index){
                    var data = SubCategory().lists;
                    return
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Book_Doctor()));
                        },
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
                                backgroundImage: AssetImage(data[index].sub_image),
                              ),
                              title: Text('Dr. '+data[index].sub_name.toString().substring(0, 5), textAlign: TextAlign.start,),

                            ),
                          )
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
