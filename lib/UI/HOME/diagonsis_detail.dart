import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/sub_category_p.dart';
import 'package:online_doctor_booking/UI/DIAGNOSIS/diagnostics.dart';
import 'package:online_doctor_booking/UI/MY_CART/my_cart.dart';

class DiagonsisDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Diagnosis', style: TextStyle(fontWeight: FontWeight.bold),),
        //centerTitle: true,
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
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text('$categoryName',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),

          Container(
            height: size.height * 0.06,
            width: size.width,
            margin: EdgeInsets.only(bottom: 10,left: 15, right: 15, top: 15),
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
                Text('    Search'),
                Padding(
                  padding: EdgeInsets.only(left: 215),
                  child: Image(image: AssetImage("assets/images/img_6.png"),height: 25,width: 30,),
                ),
              ],
            ),
          ),

          Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Slider
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CarouselSlider.builder(
                        itemCount: Carousel().lists.length,
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height * 0.14,
                          autoPlay: true,
                          autoPlayInterval: Duration(milliseconds: 2000),
                          viewportFraction: 0.45,
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
                                width: MediaQuery.of(context).size.height * 0.80,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    //Card
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
                      child: FutureBuilder(
                        future: Diagonstics(thanaName: 'Tangail Sadar'),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.connectionState != ConnectionState.done){
                            return const Center(child: CircularProgressIndicator(),);
                          }

                            if(snapshot.hasData){
                              return GridView.builder(
                                  itemCount: snapshot.data.data.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 150,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 0,
                                      crossAxisCount: 2),
                                  itemBuilder: (BuildContext context, int index){
                                    return GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis(diagnosisId: snapshot.data.data[index].id,)));
                                      },
                                      child:
                                      Card(
                                        shadowColor: colors,
                                        elevation: 4,
                                        //margin: EdgeInsets.only(top: 5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                                              child: Image(
                                                image: AssetImage('assets/images/medi0.png'),
                                                height: size.height * 0.06,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 3, bottom: 2),
                                              child: Text(snapshot.data.data[index].name, style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.center,),
                                            ),
                                            Text(snapshot.data.data[index].branchName, style: TextStyle(color: Colors.green),)
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }

                            return Text('');
                        },
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
