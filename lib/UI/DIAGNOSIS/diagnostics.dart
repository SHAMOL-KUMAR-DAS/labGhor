import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/CONFIGURE/snack_bar.dart';
import 'package:online_doctor_booking/UI/DOCTOR/doctors.dart';
import 'package:online_doctor_booking/UI/OREDER/order_page.dart';
import 'package:online_doctor_booking/UI/PAGE/test_category.dart';
import 'package:online_doctor_booking/UI/TEST/test_list.dart';

class Diagnosis extends StatelessWidget {

  var diagnosisId, diagnosisName;
  Diagnosis({this.diagnosisId, this.diagnosisName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('${diagnosisName}', style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
        elevation: 0,

      ),

      body: Column(
        children: [
          //Slider
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 10),
            child: FutureBuilder(
              future: TestSuggestProduct(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState != ConnectionState.done){
                  return const Center(child: CircularProgressIndicator(),);
                }

                if(snapshot.hasData){
                  return  CarouselSlider.builder(
                    itemCount: snapshot.data.data.length,
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.16,
                        autoPlay: true,
                        autoPlayInterval: Duration(milliseconds: 2000),
                        viewportFraction: 0.54
                    ),
                    itemBuilder: (context, index, realIndex) {
                      var data = snapshot.data.data[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(dTestId: data.dTestId,
                            product: data.name, price: data.mrp,)));
                        },
                        child: Container(
                            margin:  EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFf3f6fb),
                                image:
                                data.img != '' ?
                                DecorationImage(image: NetworkImage(data.img), fit: BoxFit.cover)
                                    :
                                DecorationImage(image: AssetImage('assets/images/medi1.png'), fit: BoxFit.cover)
                            ),
                            child: Container(

                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(child: Text(data.name,style: TextStyle(color: Colors.white),)),
                            )
                        ),
                      );

                    },
                  );
                }

                return Text('');
              },
            ),

          ),

          //Services
          Text('Services',textAlign: TextAlign.start,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),

          //Book a Doctor
          Row(
            children: [
              //Book a Doctor
              GestureDetector(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Doctors()));
                  global().appSnackBar(context, 'Coming Soon');
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
                      Image(image: AssetImage('assets/images/img_7.png'),height: size.height * 0.12,),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('BOOK A DOCTOR',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                      ),

                    ],
                  ),
                ),
              ),

              Spacer(),
              //Test
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TestCategories(diagnosisId: diagnosisId,)));
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
                      Image(image: AssetImage('assets/images/img_8.png'),height: size.height * 0.12,),
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

          //Health Packages
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text('Health Packages', textAlign: TextAlign.center,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          ),

          //Health Package View
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
              child: FutureBuilder(
                future: TestPackageList(diagnosticId: diagnosisId),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    if(snapshot.hasData){
                      return GridView.builder(
                          itemCount: snapshot.data.data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 80,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int index){
                            var data = snapshot.data.data[index];
                            return GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context) => TestList(packageId: data.packageId, page: 'package',)));

                              },
                              child: Card(
                                  shadowColor: colors,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: ListTile(
                                      leading: data.image != null ? Image.network(data.image) : Image.asset('assets/images/demo1.png'),
                                      title: Text(data.name, textAlign: TextAlign.start,),
                                    ),
                                  )
                              ),
                            );
                          });
                    }

                    return Text('');
                  })
            ),
          ),
        ],
      ),
    );
  }
}
