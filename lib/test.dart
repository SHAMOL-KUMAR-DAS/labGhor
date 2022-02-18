// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'MODEL/carousel_p.dart';
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFacdbf9),
//         title: Text('Shop'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Row(
//               children: const [
//                 Icon(Icons.search_rounded),
//                 Icon(Icons.menu)
//               ],
//             ),
//           )
//         ],
//       ),
//
//       body: Column(
//         children:  [
//
//           Padding(
//             padding: const EdgeInsets.only(top: 20),
//             child: CarouselSlider.builder(
//               itemCount: Carousel().lists.length,
//               options: CarouselOptions(
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   autoPlay: true,
//                   autoPlayInterval: Duration(milliseconds: 2000),
//                   viewportFraction: 0.65
//                 //reverse: true
//               ),
//               itemBuilder: (context, index, realIndex) {
//                 var data = Carousel().lists;
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 5),
//                   color: Color(0xFFf3f6fb),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image(
//                       image: AssetImage(data[index].image),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//
//           Container(
//             margin: const EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children:  [
//                 Text('Category', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
//                 Row(
//                   children: [
//                     Column(
//                       children: [
//                         Card(
//                           color: Colors.white,
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//
//                           child: Container(
//                             height: size.height * 0.1,
//                             width: size.width * 0.29,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(25)
//                             ),
//                             child: Column(
//                               children: [
//                                 Image(image: AssetImage('assets/images/demo1.png'),height: size.height * 0.065,),
//                                 Text('Medicine')
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         Card(
//                           color: Colors.white,
//                           elevation: 10,
//                           margin: EdgeInsets.only(top: 25),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Container(
//                             height: size.height * 0.2,
//                             width: size.width * 0.29,
//                             child: Column(
//                               children: [
//                                 Image(image: AssetImage('assets/images/demo2.png'),height: size.height * 0.17,),
//                                 Text('Syrup')
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                     Spacer(),
//
//                     Column(
//                       children: [
//
//
//                         Card(
//                           color: Colors.white,
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Container(
//                             height: size.height * 0.2,
//                             width: size.width * 0.29,
//                             child: Column(
//                               children: [
//                                 Image(image: AssetImage('assets/images/demo2.png'),height: size.height * 0.17,),
//                                 Text('Syrup')
//                               ],
//                             ),
//                           ),
//                         ),
//                         Card(
//                           color: Colors.white,
//                           elevation: 10,
//                           margin: EdgeInsets.only(top: 25),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//
//                           child: Container(
//                             height: size.height * 0.1,
//                             width: size.width * 0.29,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(25)
//                             ),
//                             child: Column(
//                               children: [
//                                 Image(image: AssetImage('assets/images/demo1.png'),height: size.height * 0.065,),
//                                 Text('Medicine')
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//
//                     Column(
//                       children: [
//                         Card(
//                           color: Colors.white,
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//
//                           child: Container(
//                             height: size.height * 0.1,
//                             width: size.width * 0.29,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(25)
//                             ),
//                             child: Column(
//                               children: [
//                                 Image(image: AssetImage('assets/images/demo5.png'),height: size.height * 0.065,),
//                                 Text('Medicine')
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         Card(
//                           color: Colors.white,
//                           elevation: 10,
//                           margin: EdgeInsets.only(top: 25),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Container(
//                             height: size.height * 0.2,
//                             width: size.width * 0.29,
//                             child: Column(
//                               children: [
//                                 Image(image: AssetImage('assets/images/demo6.png'),height: size.height * 0.17,),
//                                 Text('Syrup')
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             )
//           )
//         ],
//       ),
//     );
//   }
// }
