
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/Cubit.dart';
import 'package:movies/Bloc/States.dart';

class ReleasesWidget extends StatelessWidget {

  String imageUrl;
  String iconBokemark;
  String title;
  String releaseDate;

  ReleasesWidget(
  {this.imageUrl, this.iconBokemark, this.title, this.releaseDate});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){
        return Container(
          width: 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face$imageUrl}'),
              InkWell( child: Image.asset(AppCubit.get(context).isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',),
                onTap: (){
                  AppCubit.get(context).addWatchList(title,imageUrl,releaseDate,context);
                },
              )
            ],
          ),

        );
      } ,
    );
  }

}
