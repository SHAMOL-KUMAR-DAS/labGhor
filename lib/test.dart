// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_doctor_booking/MODEL/test_list.dart';
// var _baseUrl = 'https://labghorapi.bddaimond.com/api';
//
// class Testing extends StatefulWidget {
//   @override
//   _TestingState createState() => _TestingState();
// }
//
// class _TestingState extends State<Testing> {
//
//   List contacts = [];
//
//
//   Future ShowTest({categoryName, diagnosticsId}) async{
//
//     var url = '$_baseUrl/show-test-list/Blood Test/1';
//     var response = await http.get(Uri.parse(url));
//
//     if(response.statusCode == 200){
//       ShowTestListResponse testList = showTestListResponseFromJson(response.body);
//       List test = testList.data;
//
//       print('Length: ${test.length}');
//
//       for (var i=0; i< test.length; i++){
//         print(i);
//         setState(() {
//           //contacts = ContactModel('${test[i].name}', '${test[i].sellPrice}', false) as List<ContactModel>;
//           print('*************************shamol');
//           contacts.add(ContactModel(test[i].name, test[i].mrp, false));
//         });}
//
//
//       return testList;
//     }
//   }
//   List<ContactModel> selectedContacts = [];
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     this.ShowTest();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Multi Selection ListView"),
//         centerTitle: true,
//         backgroundColor: Colors.green[700],
//       ),
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: contacts.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       // return item
//                       return ContactItem(
//                         contacts[index].name,
//                         contacts[index].mrp,
//                         contacts[index].isSelected,
//                         index,
//                       );
//                     }),
//               ),
//               selectedContacts.length > 0 ? Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 25,
//                   vertical: 10,
//                 ),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: RaisedButton(
//                     color: Colors.green[700],
//                     child: Text(
//                       "Delete (${selectedContacts.length})",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                       ),
//                     ),
//                     onPressed: () {
//                       print("Delete List Lenght: ${selectedContacts.length}");
//                       for(var i = 0; i< selectedContacts.length; i++){
//                         print('Name: ${selectedContacts[i].name}');
//                         print('Name: ${selectedContacts[i].mrp}');
//                       }
//                     },
//                   ),
//                 ),
//               ): Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget ContactItem(
//       String name, String phoneNumber, bool isSelected, int index) {
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundColor: Colors.green[700],
//         child: Icon(
//           Icons.person_outline_outlined,
//           color: Colors.white,
//         ),
//       ),
//       title: Text(
//         name,
//         style: TextStyle(
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       subtitle: Text(phoneNumber),
//       trailing: isSelected
//           ? Icon(
//         Icons.check_circle,
//         color: Colors.green[700],
//       )
//           : Icon(
//         Icons.check_circle_outline,
//         color: Colors.grey,
//       ),
//       onTap: () {
//         setState(() {
//           contacts[index].isSelected = !contacts[index].isSelected;
//           if (contacts[index].isSelected == true) {
//             selectedContacts.add(ContactModel(name, phoneNumber, true));
//           } else if (contacts[index].isSelected == false) {
//             selectedContacts
//                 .removeWhere((element) => element.name == contacts[index].name);
//           }
//         });
//       },
//     );
//   }
//
// }
//
// class ContactModel{
//
//   String name, mrp;
//   bool isSelected;
//
//   ContactModel(this.name, this.mrp, this.isSelected);
//
// }