import 'package:flutter/material.dart';
import 'package:movies/api_manager/api_manager.dart';
import 'package:movies/models/search_response.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:movies/widgets/searchItem.dart';

class SearchTab extends StatefulWidget{
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  String query;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (q){
                query=q;
                setState(() {

                });
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.white,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Type in your text",
                  fillColor: MyThemeData.darkgray),
            ),
            FutureBuilder<Search_response>(
              future: ApiManager.apiSearch(query),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //Text(snapshot.data.results[1].title,style: TextStyle(color: Colors.white,fontSize: 30),);
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context,index){
                        return Divider(color: MyThemeData.gray,);
                      },
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: searchItem(snapshot.data.results,index)
                        );
                      },
                      itemCount: snapshot.data.results.length,

                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}',style: TextStyle(color: Colors.white,fontSize: 30),));
                }
                // By default, show a loading spinner.
                return Center(child: const CircularProgressIndicator());
              },
            ),
          ],


        ),
      ),
    );
  }
}