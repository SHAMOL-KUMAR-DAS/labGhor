import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/UI/HOME/home_page.dart';
import 'package:online_doctor_booking/UI/SHOP/shop_category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shop extends StatefulWidget {
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  SharedPreferences? prefs;
  var userId;
  sharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
    userId = (prefs!.getString('token') ?? "");
  }
  @override
  void initState() {
    super.initState();
    sharedPreferences();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Shop'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children:  [
                Icon(Icons.search_rounded),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Icon(Icons.menu))
              ],
            ),
          )
        ],
      ),

      body: Column(
        children:  [

          userId != '' ?
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

          )
          :
          Container(),

          Container(
              margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text('Category', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                  Container(
                    margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 0),
                    child: FutureBuilder(
                      future: ShopCategoryList(),
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
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: size.height * 0.13,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 0,
                                  crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int index){
                                return GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: '${snapshot.data.data[index].category}',)));
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
                                          child: Text(' ${snapshot.data.data[index].category} ', style: TextStyle(fontSize: 12,color: Colors.black),textAlign: TextAlign.center,),
                                        ),
                                        //Text(snapshot.data.data[index].branchName, style: TextStyle(color: Colors.green),)
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
              )
          ),

          const Text('Top Items', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
              child: FutureBuilder(
                future: ShopProductList(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if(snapshot.connectionState != ConnectionState.done){
                    return Text('');
                  }

                  if(snapshot.hasData){
                    return GridView.builder(
                        itemCount: snapshot.data.data.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: size.height * 0.17,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index){
                          var data = Category().lists;
                          return Card(
                            shadowColor: colors,
                            elevation: 4,
                            //margin: EdgeInsets.only(top: 5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:  Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Image(
                                    image: AssetImage(data[index].item_image),
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
                          );
                        });
                  }
                  return Text('');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
