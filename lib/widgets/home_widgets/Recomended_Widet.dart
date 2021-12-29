
import 'package:flutter/material.dart';
import 'package:movies/firebase_utils/firebase_utils.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/toprated_response.dart';
import 'package:movies/screens/home_tabs/movie_detials.dart';
import 'package:movies/theme_app/themeApp.dart';

class RecomendedWidet extends StatefulWidget {
   List<Results> results;
   String iconBokemark;
   int index;

   RecomendedWidet({@required this.results, @required this.iconBokemark,@required this.index});

  @override
  _RecomendedWidetState createState() => _RecomendedWidetState();
}

class _RecomendedWidetState extends State<RecomendedWidet> {
  bool isAddedToWatchlist=false;

  @override
  Widget build(BuildContext context) {
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
                 Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${widget.results[widget.index].posterPath}'),
                 Row(children: [
                   Image.asset('assets/star.png'),
                   Text('${widget.results[widget.index].voteAverage}')
                 ],),
                 Text('${widget.results[widget.index].title}',overflow: TextOverflow.ellipsis,),
                 Text('${widget.results[widget.index].releaseDate}',overflow: TextOverflow.ellipsis,)

               ],
             ),
             InkWell(
               child: Image.asset(isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',),
               onTap: (){
                 addWatchList(widget.results[widget.index].title,widget.results[widget.index].posterPath,widget.results[widget.index].releaseDate,context);
               },
             )
           ],
         ),

      ),
      onTap: (){
        Navigator.push(context,MaterialPageRoute(
          builder: (context) => MovieDetials(movieID: widget.results[widget.index].id,),
        ),);
      },
    );
  }

   void addWatchList(String title,String imgUrl,String publishDate,context) {
     addWatchlistToFirebase(title,imgUrl,publishDate).then((value) {
       setState(() {
         isAddedToWatchlist=true;
       });
     }).onError((error, stackTrace) {
       print(error.toString());
     }).timeout(Duration(seconds: 30), onTimeout: () {
       print('timeout');
     });
   }
}
