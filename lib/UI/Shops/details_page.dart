
import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:online_doctor_booking/CONFIGURE/button_config.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/description.dart';

class ShopDetail extends StatefulWidget {
  var product_image, product_name, product_price, product_description;
  ShopDetail(this.product_image, this.product_name, this.product_price, this.product_description);

  @override
  State<ShopDetail> createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  num _defaultValue = 1;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      //backgroundColor: backColor,
      appBar: AppBar(
        backgroundColor: colors,
        title: Text('${widget.product_name} Details'),
      ),
      body: Container(
        padding: EdgeInsets.only(left:10, right:10,bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              Image.asset(widget.product_image,
                fit: BoxFit.fill,
              ),
              //Product Name
              Text(widget.product_name,style: productDetailsName,),
              //Product Price
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10,),
                child: Text('Price: ${widget.product_price}',style: productDetailsPrice,),),

              //Quantity
              ElegantNumberButton(
                initialValue: _defaultValue,
                minValue: 1,
                maxValue: 10,
                step: 1,
                decimalPlaces: 0,
                onChanged: (value) {
                  setState((){
                    _defaultValue = value;
                  });
              },

              ),

              //Product Details
              ConstrainedBox(
                constraints: new BoxConstraints(
                  //minHeight: 35.0,
                  maxHeight: size.height,
                ),
                //width: MediaQuery.of(context).size.width * 0.8,
                child: ListView.builder(
                    itemCount: Description().lists.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index){
                      var data = Description().lists;
                      return  Table(
                        children: [
                          TableRow( children: [
                            Text('${data[index].name} :'),
                            Padding(
                              padding: const EdgeInsets.only(top: 0,bottom: 8),
                              child: Text(data[index].details),
                            ),
                          ]),
                        ],
                      );
                    }),
              ),
              //Description
              Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text('Description:',style: jobText,))
              ),//fghf
              Text(widget.product_description),
              //Submit
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: ButtonConfig.FlatButton(
                  text: 'Add to Cart',
                  press: (){
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}