import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/sub_category_p.dart';
import 'package:online_doctor_booking/UI/MY_CART/my_cart.dart';

class ShopCategory extends StatelessWidget {

  var categoryName;
  ShopCategory({this.categoryName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Products', style: TextStyle(fontWeight: FontWeight.bold),),
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

      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$categoryName',textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),

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
                Text('    Search')
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
                      child: FutureBuilder(
                        future: ShopSuggestProduct(),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.connectionState != ConnectionState.done){
                            return Text('');
                          }

                          if(snapshot.hasData){
                            return  CarouselSlider.builder(
                              itemCount: snapshot.data.data.length,
                              options: CarouselOptions(
                                  height: MediaQuery.of(context).size.height * 0.1,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(milliseconds: 2000),
                                  viewportFraction: 0.3
                              ),
                              itemBuilder: (context, index, realIndex) {
                                var data = snapshot.data.data[index];
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  width: size.width * 0.51,
                                  color: const Color(0xFFf3f6fb),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(data.name),

                                      Text(data.mrp)
                                    ],
                                  ),
                                );
                              },
                            );
                          }

                          return Text('');
                        },
                      ),
                    ),

                    //Card
                    Container(
                      margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
                      child: FutureBuilder(
                        future: ShopCategoryProductList(category: categoryName),
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
                                  var data = SubCategory().lists;
                                  return GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>My_Cart(type: 'shop',
                                        item: 'single',price: snapshot.data.data[index].mrp,product: snapshot.data.data[index].name,productId: snapshot.data.data[index].id,)));
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
                                              image: AssetImage(data[index].sub_image),
                                              height: size.height * 0.06,
                                            ),
                                          ),
                                          Flexible(child: Text(snapshot.data.data[index].name, style: TextStyle(fontSize: 12,color: Colors.black),)),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 3, bottom: 2),
                                            child: Text(snapshot.data.data[index].mrp),
                                          ),
                                          Text(snapshot.data.data[index].status == 'Live' ? 'In Stock' : 'Out Of Stock', style: TextStyle(color: snapshot.data.data[index].status == 'Live' ? Colors.green : Colors.red),)
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
