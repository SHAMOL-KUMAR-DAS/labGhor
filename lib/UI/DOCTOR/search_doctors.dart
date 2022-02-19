import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/carousel_p.dart';
import 'package:online_doctor_booking/MODEL/sub_category_p.dart';

class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}

class SearchDoctor extends StatefulWidget {
  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  String dropdownValue = 'Option 1';
  int currentValue = 0;
  Item? selectedUser;
  List<Item> users = <Item>[
    const Item('Android',Icon(Icons.android,color:  const Color(0xFF167F67),)),
    const Item('Flutter',Icon(Icons.flag,color:  const Color(0xFF167F67),)),
    const Item('ReactNative',Icon(Icons.format_indent_decrease,color:  const Color(0xFF167F67),)),
    const Item('iOS',Icon(Icons.mobile_screen_share,color:  const Color(0xFF167F67),)),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Doctors', style: TextStyle(fontWeight: FontWeight.bold),),
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

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: size.height*0.3,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Select Your Nearest Doctor",style: TextStyle(color: Colors.black,fontSize: 18),),
                Row(
                  children: [
                    Container(
                      height: size.height*.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0.0),

                      ),
                      child: DropdownButton<Item>(
                        elevation: 0,
                        underline: SizedBox(),
                        hint:  Text(" Select-Category",style: TextStyle(fontSize: 14,color: Colors.black),),
                        value: selectedUser,
                        onChanged: (Item? Value) {
                          setState(() {
                            selectedUser = Value;
                          });
                        },
                        items: users.map((Item user) {
                          return  DropdownMenuItem<Item>(
                            value: user,
                            child: Row(
                              children: <Widget>[
                                user.icon,
                                SizedBox(width: 10,),
                                Text(
                                  user.name,
                                  style:  TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: size.height*.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0.0),

                      ),
                      child: DropdownButton<Item>(
                        underline: SizedBox(),
                        hint:  Text(" Select-District",style: TextStyle(fontSize: 14,color: Colors.black),),
                        value: selectedUser,
                        onChanged: (Item? Value) {
                          setState(() {
                            selectedUser = Value;
                          });
                        },
                        items: users.map((Item user) {
                          return  DropdownMenuItem<Item>(
                            value: user,
                            child: Row(
                              children: <Widget>[
                                user.icon,
                                SizedBox(width: 10,),
                                Text(
                                  user.name,
                                  style:  TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: size.height*.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0.0),

                      ),
                      child: DropdownButton<Item>(
                        underline: SizedBox(),
                        hint:  Text(" Select-Thana",style: TextStyle(fontSize: 14,color: Colors.black),),
                        value: selectedUser,
                        onChanged: (Item? Value) {
                          setState(() {
                            selectedUser = Value;
                          });
                        },
                        items: users.map((Item user) {
                          return  DropdownMenuItem<Item>(
                            value: user,
                            child: Row(
                              children: <Widget>[
                                user.icon,
                                SizedBox(width: 10,),
                                Text(
                                  user.name,
                                  style:  TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      height: size.height*.05,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0.0),

                      ),
                      child: DropdownButton<Item>(
                        underline: SizedBox(),
                        hint:  Text(" Select-Union",style: TextStyle(fontSize: 14,color: Colors.black),),
                        value: selectedUser,
                        onChanged: (Item? Value) {
                          setState(() {
                            selectedUser = Value;
                          });
                        },
                        items: users.map((Item user) {
                          return  DropdownMenuItem<Item>(
                            value: user,
                            child: Row(
                              children: <Widget>[
                                user.icon,
                                SizedBox(width: 10,),
                                Text(
                                  user.name,
                                  style:  TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10,left: 10,bottom: 5,right: 13),
                      height: size.height*.08,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0.0),

                      ),
                      child:
                      SizedBox(
                        width: size.width*.4,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: 'Doctor Name',
                              hintText: 'Doctor Name'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      margin: EdgeInsets.only(left: 20),
                      height: size.height*.08,
                      width: size.width*.4,
                      decoration: BoxDecoration(
                        color: deepBlue,
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                      child: Text("Filter",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    ),


                  ],
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 5,bottom: 5),
            width: size.width,
            color: Color(0xffE3E2FF),
              child: Text('    SELECT A DOCTOR')),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 8),
              child: GridView.builder(
                  itemCount: SubCategory().lists.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 80,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index){
                    var data = SubCategory().lists;
                    return Card(
                        shadowColor: colors,
                        elevation: 4,
                        //margin: EdgeInsets.only(top: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: appBarColor,
                              backgroundImage: AssetImage(data[index].sub_image),
                            ),
                            title: Text('Dr. '+data[index].sub_name.toString().substring(0, 5), textAlign: TextAlign.start,),

                          ),
                        )
                    );
                  }),
            ),
          )

        ],
      ),
    );
  }
}

