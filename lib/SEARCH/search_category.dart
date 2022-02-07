
import 'package:flutter/material.dart';
import 'package:online_doctor_booking/MODEL/category.dart';

class SearchCategory extends SearchDelegate{
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
        future: SearchCategories(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: Category().lists.length,
                itemBuilder: (context, index){
                  var data = Category().lists;
                  if(data[index].item_name.toString().toLowerCase().contains(query.toLowerCase())){
                    return GestureDetector(
                      onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSubCategory(data[index].item_name)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Image(image: AssetImage(data[index].item_image),)
                        ),

                        title: Text(data[index].item_name),
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
        future: SearchCategories(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: Category().lists.length,
                itemBuilder: (context, index){
                  var data = Category().lists;
                  if(data[index].item_name.toString().toLowerCase().contains(query.toLowerCase())){
                    return GestureDetector(
                      onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => ShopSubCategory(data[index].item_name)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Image(image: AssetImage(data[index].item_image),)
                        ),

                        title: Text(data[index].item_name),
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