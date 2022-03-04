import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';

class Testing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: (){
            TestPackageDetails(packageId: 'Pack002');
          },
          child: Text('Get'),
        ),
      ),
    );
  }
}
