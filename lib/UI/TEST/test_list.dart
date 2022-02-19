import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/MODEL/sub_category_p.dart';
import 'package:online_doctor_booking/UI/OREDER/order_page.dart';

class TestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Test', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
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
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Test List', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),

              GridView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 80,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: 1),
                  itemBuilder: (BuildContext context, int index){
                    var data = SubCategory().lists;
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
                              backgroundImage: AssetImage(data[index].sub_image),
                            ),
                            title: Text(data[index].sub_name, textAlign: TextAlign.start,),
                            subtitle: Text('price: '+data[index].sub_price.toString().replaceAll('৳', ''), textAlign: TextAlign.start,),
                            trailing: Icon(Icons.radio_button_off),
                          ),
                        )
                    );
                  }),

              const Padding(
                padding:  EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 10),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Test Quantity: 2'),
                    Text('Total Price : 250'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
        },
        child: Container(
          color: appBarColor,
          height: size.height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.blue,),
              Text('Add To Cart')
            ],
          ),
        ),
      ),
    );
  }
}
