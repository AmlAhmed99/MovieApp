import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/Cubit.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/models/latest_response.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/toprated_response.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:movies/widgets/home_widgets/Recomended_Widet.dart';
import 'package:movies/widgets/home_widgets/Releases_Widget.dart';
import 'package:movies/widgets/home_widgets/popular_widget.dart';

class HomeTab extends StatefulWidget{
  static const String routeName = 'home';

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int index;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit,AppStates>(
    listener: (context,state){},
    builder:(context,state){
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<Popular_response>(
                future: AppCubit.get(context).apiLoadPopular(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //Text(snapshot.data.results[1].title,style: TextStyle(color: Colors.white,fontSize: 30),);
                    return PopularWidget(snapshot.data.results ??[]);
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}',style: TextStyle(color: Colors.white,fontSize: 30),));
                  }
                  // By default, show a loading spinner.
                  return Center(child: const CircularProgressIndicator());
                },
              ),

              FutureBuilder<Latest_response>(
                future: AppCubit.get(context).apiLoadLatest(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //Text(snapshot.data.results[1].title,style: TextStyle(color: Colors.white,fontSize: 30),);
                    return InkWell(
                      child: Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(vertical: 8) ,
                        height: 200,
                        decoration: BoxDecoration(
                            color: MyThemeData.darkgray
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Text('New Releases'),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context,index){
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ReleasesWidget(
                                          iconBokemark: 'assets/bookmark.png',
                                          imageUrl: snapshot.data.posterPath,
                                          title:snapshot.data.title,
                                          releaseDate:snapshot.data.releaseDate
                                      ),
                                    );
                                  },
                                  itemCount: 5,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}',style: TextStyle(color: Colors.white,fontSize: 30),));
                  }
                  // By default, show a loading spinner.
                  return Center(child: const CircularProgressIndicator());
                },
              ),

              FutureBuilder<toprated_response>(
                future: AppCubit.get(context).apiLoadToprated(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //Text(snapshot.data.results[1].title,style: TextStyle(color: Colors.white,fontSize: 30),);
                    return  Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 8) ,
                      height: 260,
                      decoration: BoxDecoration(
                          color: MyThemeData.darkgray
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Recomended'),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RecomendedWidet(
                                        iconBokemark: 'assets/bookmark.png',
                                        results: snapshot.data.results,
                                        index:index
                                    ),
                                  );
                                },
                                itemCount: snapshot.data.results.length,

                              ),
                            ),
                          ),
                        ],
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

      ),
    );
    } ,
    );
  }


}