import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:movies/Bloc/Cubit.dart';
class DetailsItem extends StatelessWidget {
  String imgUrl;
  String description;
  double rate;
  String releaseDate;
  String title;

  DetailsItem({this.imgUrl, this.description, this.rate,this.releaseDate,this.title});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder:(context,state){
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 10),
              child: Stack(
                children: [
                  Container(
                    child: Image.asset('https://www.themoviedb.org/t/p/w220_and_h330_face${imgUrl}',fit: BoxFit.cover,height: 170,width: 120,),
                  ),
                  InkWell(
                    child: Image.asset(AppCubit.get(context).isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',),
                    onTap: (){
                      AppCubit.get(context).addWatchList(title,imgUrl,releaseDate,context);
                    },

                  )
                ],
              ),
            ),
            Expanded(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 20,
                        width: 60,
                        child: Center(
                          child: Text('Action', style: TextStyle(
                            color: Colors.white, fontSize: 10, )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white),
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 20,
                        width: 60,
                        child: Center(
                          child: Text('Action', style: TextStyle(
                            color: Colors.white, fontSize: 10, )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white),
                        ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 20,
                        width: 60,
                        child: Center(
                          child: Text('Action', style: TextStyle(
                            color: Colors.white, fontSize: 10, )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.white),
                        ),),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 20,
                    width: 60,
                    child: Center(
                      child: Text('Action', style: TextStyle(
                        color: Colors.white, fontSize: 10, )),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.white),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0),
                  child: Text('${description}',
                      style: TextStyle(
                        color: Colors.white, fontSize: 13, )),
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: MyThemeData.Primaty_color,size: 20,),
                    Text('${rate}',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500 ))
                  ],
                )
              ],
            )
            )
          ],
        );
      } ,
    );
  }


}
