import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/PAYMENT/payment.dart';

class My_Cart extends StatefulWidget {

  var dTestId, product, price, item, type, quantity;
  My_Cart({this.dTestId, this.product, this.price, this.item, this.type, this.quantity});

  @override
  _My_CartState createState() => _My_CartState();
}

class _My_CartState extends State<My_Cart> {

  var sum = 0.0;

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
            FutureBuilder(
              future: ViewCart(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(snapshot.connectionState != ConnectionState.done){
                  return const Center(child: CircularProgressIndicator(),);
                }

                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {

                        var data = snapshot.data[index];

                        sum = sum + (double.parse(data.mrp) * int.parse(data.qty));

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
                                    Text("    ${data.testName}",textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                                    Row(
                                      children: [
                                        Text("    ৳ ${data.mrp != '' ? data.mrp : '1000'}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: Color(0xff33907C,),fontWeight: FontWeight.w600),),
                                        // SizedBox(width: size.width*.03,),
                                        // Text("৳${widget.item != 'single' ? int.parse(widget.price[index]) + (int.parse(widget.price[index]) / 10) : int.parse(widget.price[index]) + (int.parse(widget.price[index]) / 10)}"
                                        //   ,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,decoration: TextDecoration.lineThrough,color: Color(0xff8d8686) ),),
                                        //
                                        // Text(" 10% off",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Color(0xff8d8686)),),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget> [
                                        Text("    Quantity: ",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),
                                        SizedBox(width: 15),
                                        Text("${data.qty}",textAlign: TextAlign.center,style: TextStyle(fontSize: 16),),

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
                      });
                }

                return Container();
              },
            ),


          ],
        )
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
                  //widget.type != 'shop' ? AddUpdateCart(test_id: widget.productId, qty: _currentAmount) : AddUpdateCartShop(test_id: widget.productId, qty: _currentAmount);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentOption(type: '', productId: widget.dTestId, price: sum)));
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
