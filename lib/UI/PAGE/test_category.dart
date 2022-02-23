import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/UI/TEST/test_list.dart';

class TestCategories extends StatelessWidget {

  var diagnosisId;
  TestCategories({this.diagnosisId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
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

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories List',style: TextStyle(fontWeight: FontWeight.bold),),

              FutureBuilder(
                future: TestCategory(diagnosticsId: diagnosisId),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return const Center(child: CircularProgressIndicator(),);
                    }

                    if(snapshot.hasData){
                      return GridView.builder(
                          itemCount: snapshot.data.data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 80,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int index){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TestList(category: snapshot.data.data[index].category, diagnosisId: diagnosisId,)));
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
                                        backgroundImage: AssetImage('assets/images/demo1.png'),
                                      ),
                                      title: Text(snapshot.data.data[index].category, textAlign: TextAlign.start,),
                                    ),
                                  )
                              ),
                            );
                          });
                    }
                    return Text('');
                  })

            ],
          ),
        ),
      ),
    );
  }
}
