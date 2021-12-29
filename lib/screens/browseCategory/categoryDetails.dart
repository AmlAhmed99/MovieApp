
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/Cubit.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/models/categort_details.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:movies/widgets/searchItem.dart';

class CategoryDetails extends StatelessWidget {
 static const CategoryDetailsRoute='CategoryDetailsRoute';
  int generId;

 CategoryDetails({this.generId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 15),
                child: Text(
                  'Movies Category ',
                  style: TextStyle(
                      color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: FutureBuilder<CategortDetailsRespose>(
                  future: AppCubit.get(context).apiCategoryDetailsFilter(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //Text(snapshot.data.results[1].title,style: TextStyle(color: Colors.white,fontSize: 30),);
                      return AppCubit.get(context).GenerIdIsFound(snapshot.data.results,generId)?  ListView.separated(
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

                      ):
                      Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/notfound.png"),
                              Text("movies not found for this category",style: TextStyle(
                                color: Colors.white,

                              ),),
                            ],
                          ));
                    } else if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}',style: TextStyle(color: Colors.white,fontSize: 30),));
                    }
                    // By default, show a loading spinner.
                    return Center(child: const CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        );
      } ,
    );
  }


}
