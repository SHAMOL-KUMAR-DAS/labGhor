import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Order', style: TextStyle(fontWeight: FontWeight.bold),),
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

      body:
      SingleChildScrollView(
        child: Container(
          // margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               Image.asset('assets/images/medi0.png',width: MediaQuery.of(context).size.width,fit: BoxFit.cover,height:  MediaQuery.of(context).size.height*.3,),
               const Padding(
                 padding:  EdgeInsets.only(left: 18.0,right: 16.0,top: 14.0,bottom: 14),
                 child:  Text('Test 1', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.grey),),
               ),
               Container(
                 width: MediaQuery.of(context).size.width,
                 height: MediaQuery.of(context).size.height,
                 decoration: BoxDecoration(
                     color: const Color(0xffe8f6fd),
                     border: Border.all(
                       color: const Color(0xffe8f6fd),
                     ),
                     borderRadius: const BorderRadius.all(Radius.circular(20))
                 ),
                 child: Padding(
                   padding: const EdgeInsets.only(left: 18.0,right: 16.0,top: 10.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Card(
                             color: Color(0xffd4f0ff),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(14),
                             ),
                             child:
                             Padding(
                               padding: const EdgeInsets.all(7.0),
                               child: Row(
                                 children:const [
                                    Text(' 300 ৳ ', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                    Text('/ piece ', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.grey),),
                                 ],
                               ),
                             ),
                           ),
                           Card(
                             color: Color(0xffd4f0ff),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(14),
                             ),
                             child: Padding(
                               padding: const EdgeInsets.all(7.0),
                               child: Image.asset('assets/images/love.png',width: MediaQuery.of(context).size.width*.1,color: Color(0xff1b92ff),),
                             ),
                           ),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10.0,bottom: 10.0),
                         child: SmoothStarRating(
                             rating: rating,
                             size: 40,
                             starCount: 5,
                             allowHalfRating: false,
                             onRated: (v) {
                               setState(() {
                                 rating = v;
                               });
                             },
                             // isReadOnly:true,
                             color: Color(0xff1b92ff),
                             borderColor: Color(0xff1b92ff),
                             spacing:0.0
                     ),
                       ),
                       const Text('Description:', style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.grey),),
                       SizedBox(height: MediaQuery.of(context).size.height*.1,),
                       const Text('Category:', style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.grey),),

                     ],
                   ),
                 ),
               )


            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        color: appBarColor,
        height: size.height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart_outlined, color: Colors.blue,),
            Text('Add To Cart')
          ],
        ),
      ),
    );
  }
}