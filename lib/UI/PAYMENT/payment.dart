import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';

class PaymentOption extends StatefulWidget {

  var productId, type;
  PaymentOption({this.productId, this.type});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {

  var rocket          = false;
  var bkash           = false;
  var nagad           = false;
  var sureCash        = false;
  var cashOnDelivery  = true;
  var paymentMethod   = 'cashOnDelivery';

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width  = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Payment Option', style: TextStyle(fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/bkash.png',width: width * 0.5,),
                  Image.asset('assets/images/rocket.png', width: width * 0.5, height: height * 0.15,),
                ],
              ),

              Row(
                children: [
                  Image.asset('assets/images/sureCash.png',width: width * 0.5,),
                  Image.asset('assets/images/nagad.png', width: width * 0.5, height: height * 0.15,),
                ],
              ),
              
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: rocket ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_off),

                      title: Text('Rocket', textAlign: TextAlign.start,),

                      onTap: (){
                        setState(() {
                          // rocket         = !rocket;
                          // bkash          = false;
                          // nagad          = false;
                          // sureCash       = false;
                          // cashOnDelivery = false;
                          paymentMethod  = 'Rocket';
                        });
                      },
                    ),
                  )
              ),

              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: bkash ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_off),

                      title: Text('BKash', textAlign: TextAlign.start,),

                      onTap: (){
                        setState(() {
                          // bkash          = !bkash;
                          // rocket         = false;
                          // nagad          = false;
                          // sureCash       = false;
                          // cashOnDelivery = false;
                          paymentMethod  = 'BKash';
                        });
                      },
                    ),
                  )
              ),

              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: nagad ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_off),

                      title: Text('Nagad', textAlign: TextAlign.start,),

                      onTap: (){
                        setState(() {
                          // nagad          = !nagad;
                          // rocket         = false;
                          // bkash          = false;
                          // sureCash       = false;
                          // cashOnDelivery = false;
                          paymentMethod  = 'Nagad';
                        });
                      },
                    ),
                  )
              ),

              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: sureCash ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_off),

                      title: Text('Sure Cash', textAlign: TextAlign.start,),

                      onTap: (){
                        setState(() {
                          // sureCash       = !sureCash;
                          // rocket         = false;
                          // bkash          = false;
                          // nagad          = false;
                          // cashOnDelivery = false;
                          paymentMethod  = 'SureCash';
                        });
                      },
                    ),
                  )
              ),

              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: cashOnDelivery ? Icon(Icons.radio_button_checked) : Icon(Icons.radio_button_off),

                      title: Text('Cash on Delivery', textAlign: TextAlign.start,),

                      onTap: (){
                        setState(() {
                          cashOnDelivery = true;
                          rocket         = false;
                          bkash          = false;
                          nagad          = false;
                          sureCash       = false;
                          paymentMethod  = 'cashOnDelivery';
                        });
                      },
                    ),
                  )
              ),

              // Container(
              //   padding: EdgeInsets.only(top: 10,left: 10.0,right: 10.0),
              //   margin: EdgeInsets.only(top: 15),
              //   height: height*.28,
              //   width: width,
              //   color: Colors.white,
              //   child:
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text("Price Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black),),
              //       SizedBox(height: height*.03,),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text("Price (1 item)",style: TextStyle(fontSize: 15,color: Colors.black87),),
              //           Text("৳ ${widget.price}",style: TextStyle(fontSize: 15,color: Colors.black87),),
              //         ],
              //       ),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text("Delivery Fee",style: TextStyle(fontSize: 15,color: Colors.black87),),
              //           Text("৳ 0.0",style: TextStyle(fontSize: 15,color: Colors.black87),),
              //         ],
              //       ),
              //       Divider(),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text("Total Amount",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold),),
              //           Text("৳ ${widget.price}",style: TextStyle(fontSize: 16,color: Colors.black87,fontWeight: FontWeight.bold),),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: height*.12,
        width: width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 25.0,bottom: 25.0),
          child: ButtonTheme(
              buttonColor: deepBlue,
              minWidth: MediaQuery.of(context).size.width*.4,
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  widget.type != 'shop' ?
                      {
                        TestOrder(context, paymentMethod: paymentMethod, testId: widget.productId)
                      }
                      :
                      {
                        ShopOrder(context, paymentMethod: paymentMethod, testId: widget.productId)
                      };

                },
                child: const Text(
                  'Checkout',
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
