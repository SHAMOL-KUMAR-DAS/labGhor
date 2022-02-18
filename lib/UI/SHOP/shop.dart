import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/UI/HOME/home_page.dart';
import 'package:online_doctor_booking/UI/SHOP/shop_category.dart';

class Shop extends StatelessWidget {
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

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: CarouselSlider.builder(
              itemCount: Carousel().lists.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.1,
                  autoPlay: true,
                  autoPlayInterval: Duration(milliseconds: 2000),
                  viewportFraction: 0.3
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

          Container(
              margin: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  Text('Category', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  Row(
                    children: [
                      Column(
                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: 'Medicine',)));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Container(
                                height: size.height * 0.1,
                                width: size.width * 0.29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/demo1.png'),height: size.height * 0.065,),
                                    Text('Medicine')
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: 'Syrup',)));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              margin: EdgeInsets.only(top: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.29,
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/demo2.png'),height: size.height * 0.17,),
                                    Text('Syrup')
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Spacer(),

                      Column(
                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: 'Syrup',)));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.29,
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/demo2.png'),height: size.height * 0.17,),
                                    Text('Syrup')
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: 'Medicine',)));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              margin: EdgeInsets.only(top: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Container(
                                height: size.height * 0.1,
                                width: size.width * 0.29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/demo1.png'),height: size.height * 0.065,),
                                    Text('Medicine')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),

                      Column(
                        children: [

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: 'Medicine',)));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Container(
                                height: size.height * 0.1,
                                width: size.width * 0.29,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)
                                ),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/demo5.png'),height: size.height * 0.065,),
                                    Text('Medicine')
                                  ],
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopCategory(categoryName: 'Syrup',)));
                            },
                            child: Card(
                              color: Colors.white,
                              elevation: 10,
                              margin: EdgeInsets.only(top: 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: size.height * 0.2,
                                width: size.width * 0.29,
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/demo6.png'),height: size.height * 0.17,),
                                    Text('Syrup')
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
          ),

          const Text('Top Items', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
              child: GridView.builder(
                  itemCount: Category().lists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 110,
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image(
                              image: AssetImage(data[index].item_image),
                              height: 50,
                            ),
                          ),
                          Flexible(child: Text(data[index].item_name, style: TextStyle(fontSize: 12,color: Colors.black),))
                        ],
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
