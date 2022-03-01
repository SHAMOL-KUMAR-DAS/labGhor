import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/ADD_ADDRESS/add_address.dart';

class My_Cart extends StatefulWidget {

  var dTestId;
  My_Cart({this.dTestId});

  @override
  _My_CartState createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {
  int _currentAmount = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text("My Cart${widget.dTestId}"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Add_Address()));
            },
            child: Container(
              padding: EdgeInsets.only(top: 10),
              height: size.height*.08,
              width: size.width,
              color: Colors.white,
              child: Text("+ Add New Address",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.only(top: 15),
            height: size.height*.28,
            width: size.width,
            color: Colors.white,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: size.width*.03,),
                    Image.asset("assets/images/img.png",height: size.width*.3,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("    Coca Cola",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                        Row(
                          children: [
                            Text("    \$25",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xff33907C,),fontWeight: FontWeight.w600),),
                            SizedBox(width: size.width*.03,),
                            Text("\$50",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,decoration: TextDecoration.lineThrough,color: Color(0xff8d8686) ),),
                            Text(" 50% off",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Color(0xff8d8686)),),
                          ],
                        ),
                        Row(
                          children: <Widget> [
                            Text("    Quantity: ",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentAmount -= 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "$_currentAmount",
                              // style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentAmount += 1;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),

                          ],
                        ),


                      ],
                    ),
                  ],
                ),
                Divider(),
                Text("Remove",style: TextStyle(color: Color(0xff8d8686),fontSize: 16),)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10,left: 10.0,right: 10.0),
            margin: EdgeInsets.only(top: 15),
            height: size.height*.28,
            width: size.width,
            color: Colors.white,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
                SizedBox(height: size.height*.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price (1 item)",style: TextStyle(fontSize: 15,color: Colors.black87),),
                    Text("\$25",style: TextStyle(fontSize: 15,color: Colors.black87),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Fee",style: TextStyle(fontSize: 15,color: Colors.black87),),
                    Text("Info",style: TextStyle(fontSize: 15,color: Colors.black87),),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Amount",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold),),
                    Text("\$25",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height*.15,
        width: size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 25.0,bottom: 25.0),
          child: ButtonTheme(
              buttonColor: deepBlue,
              minWidth: MediaQuery.of(context).size.width*.4,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                },
                child: const Text(
                  'Continue to Payment',
                  style:  TextStyle(color: Colors.white, fontSize: 18),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28)),
              )),
        ),
      ),
    );
  }
}
