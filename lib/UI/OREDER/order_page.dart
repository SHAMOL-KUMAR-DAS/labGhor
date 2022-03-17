import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrderPage extends StatefulWidget {

  var dTestId;
  OrderPage({this.dTestId});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var rating = 0.0;

  final List dTestId  = [];
  final List quantity = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Book', style: TextStyle(fontWeight: FontWeight.bold),),
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

      body: FutureBuilder(
        future: TestDetails(diagnosticTestId: widget.dTestId),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.connectionState != ConnectionState.done){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            return  SingleChildScrollView(
              child: Container(
                // margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Image.asset('assets/images/img_9.png',width: MediaQuery.of(context).size.width,fit: BoxFit.cover,height:  MediaQuery.of(context).size.height*.3,),
                    Padding(
                      padding:  EdgeInsets.only(left: 18.0,right: 16.0,top: 14.0,bottom: 14),
                      child:  Text(snapshot.data.data[0].name, style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.grey),),
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
                                      children: [
                                        Text(' ${snapshot.data.data[0].sellPrice} ৳ ', style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
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
                            Flexible(child: Text('Description: \n${snapshot.data.data[0].details}', style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.grey),)),
                            SizedBox(height: MediaQuery.of(context).size.height*.1,),
                            Text('Category: ${snapshot.data.data[0].category}', style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.grey),),

                          ],
                        ),
                      ),
                    )


                  ],
                ),
              ),
            );
          }
          return Text('');
        },
      ),

      bottomNavigationBar: Container(
        color: appBarColor,
        height: size.height * 0.07,
        child:
        GestureDetector(
          onTap: (){
            setState(() {
              TestOrder(diagnosticTestId: widget.dTestId);
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Icon(Icons.shopping_cart_outlined, color: Colors.blue,),
              Text('Add To Payment'),
            ],
          ),
        ),
      ),
    );
  }
}