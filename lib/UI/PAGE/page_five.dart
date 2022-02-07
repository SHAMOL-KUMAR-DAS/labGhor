import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/category.dart';

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold),),
        //centerTitle: true,
        automaticallyImplyLeading: true,
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

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Categories List'),

              GridView.builder(
                  itemCount: Category().lists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: appBarColor,
                                backgroundImage: AssetImage(data[index].item_image),
                              ),
                              title: Text(data[index].item_name, textAlign: TextAlign.start,),
                          ),
                        )
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
