// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:online_doctor_booking/MODEL/category.dart';
//
// import 'CONFIGURE/color_config.dart';
// import 'MODEL/sub_category.dart';
//
// class Testing extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Testing'),
//         centerTitle: true,
//       ),
//
//       body: Container(
//         padding: EdgeInsets.only(top: 10, bottom: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//
//               Padding(
//                 padding: EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
//                 child: Text("Offer", //theme.textTheme.headline3
//                 //kTitleStyle
//                 ),
//               ),
//               //SizedBox(height: 25.0),
//               Container(
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.2,
//                 child: ListView.builder(
//                   itemCount: Category().lists.length,
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   physics: BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     var data = Category().lists;
//                     return GestureDetector(
//                         onTap: (){
//                           //Navigator.push(context, MaterialPageRoute(builder: (context) => BlogsDetails(snapshot.data[index].id.toString())));
//                         },
//                         child:Card(
//                           margin: EdgeInsets.only(left: 18.0, bottom: 2.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(color: Colors.red,width: 2)
//                             ),
//                             width: MediaQuery.of(context).size.width * 0.4,
//                             padding: EdgeInsets.only(top: 10,left: 10,right: 10, bottom: 0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.asset(
//                                   data[index].item_image,
//                                   fit: BoxFit.cover,
//                                   height: MediaQuery.of(context).size.height * 0.12,
//                                 ),
//                                 SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                                 Flexible(
//                                   child: Text(data[index].item_name != null ? data[index].item_name : '',style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.w600
//                                   ),),
//                                 ),
//                                 // SizedBox(height: 6.0),
//
//                               ],
//                             ),
//                           ),
//                         )
//                     );
//
//                   },
//                 ),
//               ),
//
//               Padding(
//                 padding: EdgeInsets.only(top: 15, left: 15, right: 15,bottom: 15),
//                 child: Text("All Test", //theme.textTheme.headline3
//                   //kTitleStyle
//                 ),
//               ),
//               //SizedBox(height: 25.0),
//               GridView.builder(
//                   itemCount: Category().lists.length,
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       mainAxisExtent: 110,
//                       mainAxisSpacing: 0,
//                       crossAxisSpacing: 0,
//                       crossAxisCount: 3),
//                   itemBuilder: (BuildContext context, int index){
//                     var data = Category().lists;
//                     return GestureDetector(
//                       onTap: (){
//                         //Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSubCategory(data[index].item_name)));
//                       },
//                       child: Card(
//                         // color: index % 6 == 0 ? colorOne : index % 5 == 0 ? colorTwo : index % 4 == 0 ? colorThree :
//                         // index % 3 == 0 ? colorFour : index % 2 == 0 ? colorFive : index % 1 == 0 ? colorSix : backColors,
//                         shadowColor: colors,
//                         elevation: 4,
//                         //margin: EdgeInsets.only(top: 5),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 10, bottom: 10),
//                               child: Image(
//                                 image: AssetImage(data[index].item_image),
//                                 height: 50,
//                               ),
//                             ),
//                             Flexible(child: Text(data[index].item_name, style: TextStyle(fontSize: 12,color: Colors.black),))
//                           ],
//                         ),
//                       ),
//                     );
//                   })
//
//
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }
