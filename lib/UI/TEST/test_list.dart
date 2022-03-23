import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/LOCAL/Database/cart.dart';
import 'package:online_doctor_booking/LOCAL/Model/cart.dart';
import 'package:online_doctor_booking/MODEL/test_list.dart';
import 'package:online_doctor_booking/UI/ADD_ADDRESS/add_address.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/MY_CART/my_cart.dart';
import 'package:online_doctor_booking/UI/OREDER/order_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class TestList extends StatefulWidget {

  var category, diagnosisId, packageId;
  TestList({this.category, this.diagnosisId, this.packageId});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  var dTestId;
  int _currentAmount = 0;

  SharedPreferences? prefs;
  var userId;
  sharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
    userId = (prefs!.getString('token') ?? "");
  }

  var _baseUrl = 'https://labghorapi.bddaimond.com/api';
  List contacts = [];

  Future ShowTest() async{

    var url = '$_baseUrl/show-test-list/${widget.category}/${widget.diagnosisId}';
    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      ShowTestListResponse testList = showTestListResponseFromJson(response.body);
      List test = testList.data;

      for (var i=0; i< test.length; i++){
        setState(() {
          contacts.add(ContactModel(test[i].name, test[i].mrp, test[i].testId, '0', false));
        });}
      return testList;
    }
  }

  List price      = [];
  List product    = [];
  List productId  = [];

  var sum   = 0;
  var count = 0;

  List<ContactModel> selectedContacts = [];

  @override
  void initState() {
    super.initState();
    sharedPreferences();
    this.ShowTest();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Test', style: TextStyle(fontWeight: FontWeight.bold),),
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

      body: SafeArea(
        child: Container(
          child: Column(
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

              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        contacts[index].name,
                        contacts[index].mrp,
                        contacts[index].id,
                        contacts[index].qty,
                        contacts[index].isSelected,
                        index,
                      );
                    }),
              ),

              Padding(
                padding:  EdgeInsets.only(top: 0, right: 25, left: 25, bottom: 0),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),

              selectedContacts.length > 0 ?
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Test Quantity: ${selectedContacts.length}'),

                    Text('Total Price : ${sum}'),
                  ],
                ),
              )
                  :
              Container(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: GestureDetector(
        onTap: (){


          final cart =  Cart(
              product_id : '${productId}',
              products   : '${product.toString()}',
              price      : '${price.toString()}',
              total      : '${sum.toString()}'      ,
              status     : '1'
          );
          CartDatabase.instance.createCart(cart);

          selectedContacts.length >= 1 ?
              {
          if (userId == "") {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(product: product,
              price: price, total: sum, productId: productId,)))
          }
          else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>My_Cart(product: product,
          price: price, total: sum, productId: productId,)))
          }
              } : {

          };

        },
        child: Container(
          color: appBarColor,
          height: size.height * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.blue,),
              Text('Add To Cart')
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String name, String phoneNumber, String id, String qty, bool isSelected, int index) {

    return Card(
        shadowColor: colors,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: appBarColor,
              backgroundImage: AssetImage('assets/images/demo1.png'),
            ),

            title: Text(name, textAlign: TextAlign.start,),

            subtitle: Text('${phoneNumber}', textAlign: TextAlign.start,),

            trailing: GestureDetector(
              onTap: (){
                setState(() {
                  contacts[index].isSelected = !contacts[index].isSelected;
                  if (contacts[index].isSelected == true) {
                    selectedContacts.add(ContactModel(name, phoneNumber, id, '0', true));
                    price.add(contacts[index].mrp);
                    product.add(contacts[index].name);
                    productId.add(contacts[index].id);
                    sum = sum + int.parse(contacts[index].mrp);
                  }

                  else if (contacts[index].isSelected == false) {
                    price.remove(contacts[index].mrp);
                    product.remove(contacts[index].name);
                    productId.remove(contacts[index].id);
                    sum = sum - int.parse(contacts[index].mrp);
                    selectedContacts
                        .removeWhere((element) => element.name == contacts[index].name);
                  }
                });
              },

              child: isSelected ?
              Icon(
                Icons.radio_button_checked,
                color: Colors.green[700],
              )
                  : Icon(
                Icons.radio_button_off,
                color: Colors.grey,
              ),
            ),

            onTap: (){
              if (userId == "") {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(productId: contacts[index].name,
                price: contacts[index].mrp, total: '0', product: contacts[index].id, item: 'single',)));
              }
              else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => My_Cart(product: contacts[index].name,
                  price: contacts[index].mrp, total: '0', productId: contacts[index].id, item: 'single')));
              }
            },
          ),
        )
    );
  }
}

class ContactModel{

  String name, mrp, id, qty;
  bool isSelected;

  ContactModel(this.name, this.mrp, this.id, this.qty, this.isSelected);

}