import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/PAYMENT/payment.dart';

class My_Cart extends StatefulWidget {

  var dTestId, product, productId, price, total, item, type;
  My_Cart({this.dTestId, this.product, this.productId, this.price, this.total, this.item, this.type});

  @override
  _My_CartState createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {

  int _currentAmount = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: deepBlue,
        title: Text("My Cart"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.015),
              child: ListView.builder(
                  itemCount: widget.item != 'single' ? widget.product.length : 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {

                    // return item
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: size.width*.03,),
                            Image.asset("assets/images/demo1.png",height: size.width*.3,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("    ${widget.item != 'single' ? widget.product[index] : widget.product}",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                                Row(
                                  children: [
                                    Text("    ৳${widget.item != 'single' ? widget.price[index] : widget.price}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xff33907C,),fontWeight: FontWeight.w600),),
                                    SizedBox(width: size.width*.03,),
                                    Text("৳${widget.item != 'single' ? int.parse(widget.price[index]) + (int.parse(widget.price[index]) / 10) : int.parse(widget.price[index]) + (int.parse(widget.price[index]) / 10)}"
                                      ,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,decoration: TextDecoration.lineThrough,color: Color(0xff8d8686) ),),

                                    Text(" 10% off",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Color(0xff8d8686)),),
                                  ],
                                ),
                                Row(
                                  children: <Widget> [
                                    Text("    Quantity: ",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                                    SizedBox(width: 15),
                                    _currentAmount <= 0 ?
                                        Container() :
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _currentAmount--;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 3,
                                                offset: Offset(0.5, 4)
                                            ),
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: Offset(0.0, 0.75)
                                            )
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: Colors.white,
                                          child: Text('-',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10),
                                    Text(
                                      "$_currentAmount",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),

                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          _currentAmount++;
                                        });
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey.shade400,
                                                blurRadius: 3,
                                                offset: Offset(0.5, 4)
                                            ),
                                            BoxShadow(
                                                color: Colors.grey.shade300,
                                                blurRadius: 3,
                                                offset: Offset(0.0, 0.75)
                                            )
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: 17,
                                          backgroundColor: Colors.white,
                                          child: Text('+',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                    );
                  }),
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
                      Text("৳${widget.item != 'single' ? widget.price : widget.price}",style: TextStyle(fontSize: 15,color: Colors.black87),),
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
                      Text("৳${widget.item != 'single' ? widget.price : int.parse(widget.price.toString()) * _currentAmount}",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
                  widget.type != 'shop' ? AddUpdateCart(test_id: widget.productId, qty: _currentAmount) : AddUpdateCartShop(test_id: widget.productId, qty: _currentAmount);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOption(type: 'shop',price: widget.item == 'single' ? int.parse(widget.price) * _currentAmount : widget.price, productId: widget.productId)));
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
