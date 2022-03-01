import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/category_p.dart';
import 'package:online_doctor_booking/MODEL/sub_category_p.dart';
import 'package:online_doctor_booking/UI/LOGIN/login_page.dart';
import 'package:online_doctor_booking/UI/MY_CART/my_cart.dart';
import 'package:online_doctor_booking/UI/OREDER/order_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestList extends StatefulWidget {

  var category, diagnosisId;
  TestList({this.category, this.diagnosisId});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  var count = 0;
  var dTestId;

  SharedPreferences? prefs;
  var userId;
  sharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
    userId = (prefs!.getString('token') ?? "");
  }

  @override
  void initState() {
    super.initState();
    sharedPreferences();
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

      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Test List', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),

              FutureBuilder(
                future: ShowTest(categoryName: widget.category, diagnosticsId: widget.diagnosisId),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.connectionState != ConnectionState.done){
                      return const Center(child: CircularProgressIndicator(),);
                    }

                    if(snapshot.hasData){
                      return GridView.builder(
                          itemCount: snapshot.data.data.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 80,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              crossAxisCount: 1),
                          itemBuilder: (BuildContext context, int index){
                            return GestureDetector(
                              onTap: (){

                                setState(() {
                                  dTestId = snapshot.data.data[index].dTestId;
                                });
                                if (userId == "") {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(dTestId: snapshot.data.data[index].dTestId)));
                                }
                                else {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OrderPage(dTestId: snapshot.data.data[index].dTestId)));
                                }

                              },
                              child: Card(
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
                                      title: Text(snapshot.data.data[index].name, textAlign: TextAlign.start,),
                                      subtitle: Text(snapshot.data.data[index].mrp, textAlign: TextAlign.start,),
                                      trailing: Icon(Icons.radio_button_off),
                                    ),
                                  )
                              ),
                            );
                          });
                    }

                    return Text('');
                  }),


              const Padding(
                padding:  EdgeInsets.only(top: 20, right: 25, left: 25, bottom: 10),
                child: Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Test Quantity: 2'),
                    Text('Total Price : 250'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: GestureDetector(
        onTap: (){
          print('***************************************$dTestId');
          // if (userId == "") {
          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(dTestId: snapshot.data.data[index].dTestId)));
          // }
          // else {
          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OrderPage(dTestId: snapshot.data.data[index].dTestId)));
          // }
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
}
