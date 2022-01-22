import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/category.dart';
import 'package:online_doctor_booking/SEARCH/search_category.dart';
import 'package:online_doctor_booking/UI/Diagnosis/sub_category.dart';
import 'package:online_doctor_booking/UI/Shops/shop_sub_category.dart';

class DiagonisCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backColors,
      appBar: AppBar(
        backgroundColor: colors,
        title: Text('Diagnosis'),
        centerTitle: true,
        actions: [
          FlatButton(
              onPressed: (){
                showSearch(context: context, delegate: SearchCategory());
              },
              child: Icon(Icons.search,color: Colors.white,)
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.only(left: 5, right: 5, top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [

              GridView.builder(
                  itemCount: Category().lists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 110,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index){
                    var data = Category().lists;
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DiaggnosisSubProducts(data[index].item_name)));
                      },
                      child: Card(
                        color: index % 6 == 0 ? colorOne : index % 5 == 0 ? colorTwo : index % 4 == 0 ? colorThree :
                        index % 3 == 0 ? colorFour : index % 2 == 0 ? colorFive : index % 1 == 0 ? colorSix : backColors,
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
                                image: AssetImage(data[index].item_image),
                                height: size.height * 0.09,
                              ),
                            ),
                            Flexible(child: Text(data[index].item_name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),))
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}