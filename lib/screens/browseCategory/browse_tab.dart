import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/api_manager/api_manager.dart';
import 'package:movies/models/category_response.dart';
import 'package:movies/screens/browseCategory/categoryDetails.dart';
import 'package:movies/widgets/category_widget.dart';

class BrowseTab extends StatelessWidget {
  var categoryImage = [
    'assets/Action.jfif',
    'assets/Advanture.jfif',
    'assets/Animation.jfif',
    'assets/Comedy.jfif',
    'assets/Crime.jfif',
    'assets/Doc.jfif',
    'assets/Drama.jfif',
    'assets/Family.jfif',
    'assets/Fantasy.jpg',
    'assets/History.jfif',
    'assets/Action.jfif',
    'assets/Advanture.jfif',
    'assets/Animation.jfif',
    'assets/Comedy.jfif',
    'assets/Crime.jfif',
    'assets/Doc.jfif',
    'assets/Drama.jfif',
    'assets/Family.jfif',
    'assets/Fantasy.jpg',
    'assets/History.jfif',
  ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CategoryResponse>(
      future: ApiManager.apiCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //Text(snapshot.data.results[1].title,style: TextStyle(color: Colors.white,fontSize: 30),);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15),
                child: Text(
                  'Browse Category ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 4),
                itemBuilder: (_, index) => Center(
                  child: InkWell(
                    child: CategoryWidet(
                        snapshot.data.genres[index], categoryImage[index]),
                    onTap: (){
                      Navigator.push(context,  MaterialPageRoute(
                        builder: (context) => CategoryDetails(generId:snapshot.data.genres[index].id ,),
                      ));
                    }

                  ),
                ),
                itemCount: snapshot.data.genres.length,
              )),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            '${snapshot.error}',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ));
        }
        // By default, show a loading spinner.
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}
