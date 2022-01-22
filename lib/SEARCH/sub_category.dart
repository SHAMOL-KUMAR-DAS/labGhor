
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/MODEL/category.dart';
import 'package:online_doctor_booking/MODEL/sub_category.dart';
import 'package:online_doctor_booking/UI/Shops/details_page.dart';
import 'package:online_doctor_booking/UI/Shops/shop_sub_category.dart';

class SearchSubCategory extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
            FocusScope.of(context).unfocus();
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: SearchSubCategories(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: SubCategory().lists.length,
                itemBuilder: (context, index){
                  var data = SubCategory().lists;
                  if(data[index].sub_name.toString().toLowerCase().contains(query.toLowerCase())){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopDetail(data[index].sub_image, data[index].sub_name, data[index].sub_price, data[index].sub_description)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Image(image: AssetImage(data[index].sub_image),)
                        ),

                        title: Text(data[index].sub_name),
                      ),
                    );
                  }
                  return Container();
                });
          }
          return Container();
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: SearchSubCategories(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: SubCategory().lists.length,
                itemBuilder: (context, index){
                  var data = SubCategory().lists;
                  if(data[index].sub_name.toString().toLowerCase().contains(query.toLowerCase())){
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShopDetail(data[index].sub_image, data[index].sub_name, data[index].sub_price, data[index].sub_description)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Image(image: AssetImage(data[index].sub_image),)
                        ),

                        title: Text(data[index].sub_name),
                      ),
                    );
                  }
                  return Container();
                });
          }
          return Container();
        });
  }

}