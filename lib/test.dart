// import 'package:flutter/material.dart';
// import 'package:online_doctor_booking/LOCAL/Database/cart.dart';
// import 'package:online_doctor_booking/LOCAL/Model/cart.dart';
//
// class LocalsCustomer extends StatefulWidget {
//
//   @override
//   _NotesPageState createState() => _NotesPageState();
// }
//
// class _NotesPageState extends State<LocalsCustomer> {
//   late List<Cart> notes;
//   bool isLoading = false;
//
//   @override
//   void initState(){
//     super.initState();
//     refreshNotes();
//   }
//
//   @override
//   void dispose(){
//     CartDatabase.instance.close();
//     super.dispose();
//   }
//
//   Future refreshNotes() async{
//     setState(() => isLoading = true);
//
//     this.notes = await CartDatabase.instance.ViewCart();
//
//     setState(() => isLoading = false);
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: isLoading ? CircularProgressIndicator()
//             : notes.isEmpty ? Text('No Notes') : buildNotes(),
//         //child: buildNotes()
//       ),
//     );
//
//   }
//
//   Widget buildNotes() {
//     return ListView.builder(
//       itemCount: notes.length,
//       itemBuilder: (BuildContext context, int index){
//         var note = notes[index];
//         return GestureDetector(
//           onTap: (){
//             //Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetails(noteId: note.id!,)));
//           },
//           child: Card(
//               child: Container(
//                 padding: EdgeInsets.only(bottom: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//
//                     Text(' id: ${note.id ?? ' '}', style: TextStyle(fontWeight: FontWeight.bold),),
//                     Text('Product Id: ${note.product_id ?? ' '}', style: TextStyle(fontWeight: FontWeight.bold),),
//                     Text('Products : ${note.products ?? ' '}', style: TextStyle(fontWeight: FontWeight.bold),),
//                     Text('Price: ${note.price ?? ' '}', style: TextStyle(fontWeight: FontWeight.bold),),
//                     Text('Total: ${note.total ?? ' '}', style: TextStyle(fontWeight: FontWeight.bold),),
//
//                     FlatButton(
//                         onPressed: (){
//                           notes[0].id == null ? print('nothing') : print('Available');
//                           CartDatabase.instance.delete(note.id);
//                         },
//                         child: Text('Press'))
//                   ],
//                 ),
//               )
//           ),
//         );
//       },
//     );
//   }
// }