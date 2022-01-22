import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/sub_category.dart';
import 'package:online_doctor_booking/SEARCH/sub_category.dart';

import 'details_page.dart';


class ShopSubCategory extends StatelessWidget {
  var category;
  ShopSubCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: colors,
            title: Text('${category}'),
            centerTitle: true,
          actions: [
            FlatButton(
                onPressed: (){
                  showSearch(context: context, delegate: SearchSubCategory());
                },
                child: Icon(Icons.search,color: Colors.white,)
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: SubCategory().lists.length,
              itemBuilder: (BuildContext context, int index){
                var data = SubCategory().lists;

                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopDetail(data[index].sub_image, data[index].sub_name, data[index].sub_price, data[index].sub_description)));
                  },
                  child: Column(
                    children: [
                      Card(
                        //color: backColor,
                        //margin: const EdgeInsets.all(10.0),
                        shadowColor: colors,
                          elevation: 4,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(data[index].sub_image,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 3, bottom: 5, left: 5, right: 5),
                                  child: Text(
                                    data[index].sub_name, style: TextStyle(fontSize: 14,color: Colors.black),),
                                ),
                                Text(data[index].sub_price,
                                  style: TextStyle(fontWeight: FontWeight.bold),)

                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                );
              },

              staggeredTileBuilder: (int index) =>
                  StaggeredTile.fit(1),
            )
        ),
      ),
    );
  }
}

