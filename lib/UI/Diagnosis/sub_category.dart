import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/MODEL/sub_category.dart';
import 'package:online_doctor_booking/SEARCH/sub_category.dart';

class DiaggnosisSubProducts extends StatefulWidget {
  var title;
  DiaggnosisSubProducts(this.title);

  @override
  _DiaggnosisSubProductsState createState() => _DiaggnosisSubProductsState();
}

class _DiaggnosisSubProductsState extends State<DiaggnosisSubProducts> {
  num _defaultValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColors,
      appBar: AppBar(
          backgroundColor: colors,
          title: Text('${widget.title} Test'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchSubCategory());
              },
              icon: Icon(Icons.search),
            ),
          ]),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: GridView.builder(
            itemCount: SubCategory().lists.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
//reverse: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              mainAxisSpacing: 8,
              crossAxisSpacing: 0,
              crossAxisCount: 1,
//childAspectRatio: 3/2,
//childAspectRatio: 4
            ),
            itemBuilder: (BuildContext context, index) {
              var data = SubCategory().lists;
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: index % 6 == 0
                        ? colorOne
                        : index % 5 == 0
                            ? colorFive
                            : index % 4 == 0
                                ? colorFour
                                : index % 3 == 0
                                    ? colorSix
                                    : index % 2 == 0
                                        ? colorTwo
                                        : index % 1 == 0
                                            ? colorThree
                                            : backColors,
                    shadowColor: colors,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    elevation: 5,
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 3),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(data[index].sub_image),
                            height: MediaQuery.of(context).size.height * 0.16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              data[index].sub_name != null
                                  ? Text(
                                      '     ${data[index].sub_name} Test',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )
                                  : Text(''),
                              Padding(
                                padding: const EdgeInsets.only(top: 3, bottom: 5),
                                child: data[index].sub_price != null
                                    ? Text('     ${data[index].sub_price}')
                                    : Text(''),
                              ),
                            ],
                          ),

                          // ElegantNumberButton(
                          //   initialValue: _defaultValue,
                          //   minValue: 1,
                          //   maxValue: 10,
                          //   step: 1,
                          //   decimalPlaces: 0,
                          //   onChanged: (value) {
                          //     setState((){
                          //       _defaultValue = value;
                          //     });
                          //   },
                          //
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
    // GridView.builder(
  }
}
