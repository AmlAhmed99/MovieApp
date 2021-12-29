import 'package:flutter/material.dart';
import 'package:movies/api_manager/api_manager.dart';
import 'package:movies/models/details_response.dart';
import 'package:movies/models/similar_response.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:movies/widgets/details_widgets/details_item.dart';
import 'package:movies/widgets/details_widgets/top_item.dart';
import 'package:movies/widgets/home_widgets/Recomended_Widet.dart';

class MovieDetials extends StatelessWidget{
  static const String routeMovieDetials = 'routeMovieDetials';
  int movieID;

  MovieDetials({this.movieID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemeData.darkgray,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Dora and the lost city of gold',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: MyThemeData.darkgray,
      ),
      body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           TopItem(),
            FutureBuilder<Details_response>(
              future: ApiManager.apiLoadDetails(movieID),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return  DetailsItem(
                    imgUrl: snapshot.data.posterPath,
                    description: snapshot.data.overview,
                    rate: snapshot.data.voteAverage,
                    releaseDate: snapshot.data.releaseDate,
                    title:snapshot.data.title

                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('${snapshot.error}',style: TextStyle(color: Colors.white,fontSize: 30),));
                }
                // By default, show a loading spinner.
                return Center(child: const CircularProgressIndicator());
              },
            ),

            FutureBuilder<Similar_response>(
              future: ApiManager.apiLoadSimilar(movieID),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return   Container(
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
                          child: Text('More Like This',style: TextStyle(
                              color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold
                          ),),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context,index){
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:  RecomendedWidet(
                                      iconBokemark: 'assets/bookmark.png',
                                      results: snapshot.data.results,
                                      index:index,
                                    
                                  ),
                                );
                              },
                              itemCount: 5,

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
    );
  }
}