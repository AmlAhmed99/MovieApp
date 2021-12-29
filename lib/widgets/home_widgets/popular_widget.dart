
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/Cubit.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/models/popular_response.dart';

class PopularWidget extends StatelessWidget {

  List<Results> results;

  PopularWidget(this.results);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){
        return Stack(
          children: [
            Container(
              height: 190,
              width: double.infinity,
              child: Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${results[2].posterPath}',fit: BoxFit.fill,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(child: Image.asset('assets/play-icon.png',height: 60,width: 60,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 100,bottom: 15),
              child: Stack(
                children: [
                  Container(
                    child: Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${results[0].posterPath}',fit: BoxFit.cover,height: 170,width: 120,),
                  ),
                  InkWell(
                    child: Image.asset(AppCubit.get(context).isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',height: 40,width: 30,),
                    onTap: (){
                      AppCubit.get(context).addWatchList(results[0].title,results[0].posterPath,results[0].releaseDate,context);
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150,top: 200),
              child: Text(results[1].title ,  style: TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 220,left: 150),
              child: Text(results[1].releaseDate,  style: TextStyle(
                color: Colors.white, fontSize: 10, ),),
            ),
          ],
        );
      } ,
    );
  }

}
