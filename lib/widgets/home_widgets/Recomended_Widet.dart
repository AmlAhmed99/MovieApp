
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/Bloc/Cubit.dart';
import 'package:movies/screens/home_tabs/movie_detials.dart';
import 'package:movies/theme_app/themeApp.dart';

class RecomendedWidet extends StatelessWidget {
   List<Results> results;
   String iconBokemark;
   int index;

   RecomendedWidet({this.results, this.iconBokemark, this.index});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){
        return InkWell(
          child: Container(
            width: 95,
            decoration: BoxDecoration(
              color: MyThemeData.darkgray,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 4.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${results[index].posterPath}'),
                    Row(children: [
                      Image.asset('assets/star.png'),
                      Text('${results[index].voteAverage}')
                    ],),
                    Text('${results[index].title}',overflow: TextOverflow.ellipsis,),
                    Text('${results[index].releaseDate}',overflow: TextOverflow.ellipsis,)

                  ],
                ),
                InkWell(
                  child: Image.asset(AppCubit.get(context).isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',),
                  onTap: (){
                    AppCubit.get(context).addWatchList(results[index].title,results[index].posterPath,results[index].releaseDate,context);
                  },
                )
              ],
            ),

          ),
          onTap: (){
            Navigator.push(context,MaterialPageRoute(
              builder: (context) => MovieDetials(movieID:results[index].id,),
            ),);
          },
        );
      } ,
    );
  }

}
