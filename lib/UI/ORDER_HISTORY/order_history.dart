import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/MY_CART/my_cart.dart';

class Order_History extends StatefulWidget {
  const Order_History({Key? key}) : super(key: key);

  @override
  _Order_HistoryState createState() => _Order_HistoryState();
}

class _Order_HistoryState extends State<Order_History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Order History'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children:  [
                Icon(Icons.favorite,size: 35,),
                SizedBox(width: 10,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => My_Cart()));
                    },
                    child: Icon(Icons.add_shopping_cart,size: 35,)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
