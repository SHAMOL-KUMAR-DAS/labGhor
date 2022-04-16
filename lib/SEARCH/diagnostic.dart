import 'package:flutter/material.dart';
import 'package:online_doctor_booking/API/api.dart';
import 'package:online_doctor_booking/CONFIGURE/color_config.dart';
import 'package:online_doctor_booking/UI/DIAGNOSIS/diagnostics.dart';

class DiagnosisSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
            FocusScope.of(context).unfocus();
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Diagonstics(thanaName: 'Tangail Sadar'),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data.data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                var data = snapshot.data.data[index];
                if(data.name.toString().toLowerCase().contains(query.toLowerCase())){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis(diagnosisId: data.id,diagnosisName: data.name,)));
                    },
                    child: Card(
                        shadowColor: colors,
                        elevation: 4,
                        //margin: EdgeInsets.only(top: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              child: Image(
                                image: AssetImage('assets/images/medi0.png'),
                                height: size.height * 0.06,
                              ),
                            ),
                            title: Text(' ${data.name} ', style: TextStyle(fontSize: 12,color: Colors.black)),
                            subtitle: Text(data.branchName, style: TextStyle(color: Colors.green),)
                        )
                    ),
                  );
                }
                return Container();
              });
        }

        return Container();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Diagonstics(thanaName: 'Tangail Sadar'),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.connectionState != ConnectionState.done){
          return const Center(child: CircularProgressIndicator(),);
        }

        if(snapshot.hasData){
          return ListView.builder(
              itemCount: snapshot.data.data.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index){
                var data = snapshot.data.data[index];
                if(data.name.toString().toLowerCase().contains(query.toLowerCase())){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnosis(diagnosisId: data.id,diagnosisName: data.name,)));
                    },
                    child: Card(
                      shadowColor: colors,
                      elevation: 4,
                      //margin: EdgeInsets.only(top: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: data.img == '' || data.img == null ?
                          Image(
                            image: AssetImage('assets/images/medi0.png'),
                            height: size.height * 0.06,
                          )
                              :
                          Image(
                            image: NetworkImage(data.img),
                            height: size.height * 0.06,
                          ),
                        ),
                        title: Text(' ${data.name} ', style: TextStyle(fontSize: 12,color: Colors.black)),
                        subtitle: Text(data.branchName, style: TextStyle(color: Colors.green),)
                      )
                    ),
                  );
                }
                return Container();
              });
        }

        return Container();
      },
    );
  }

}