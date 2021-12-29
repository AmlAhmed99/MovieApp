
import 'package:flutter/material.dart';
import 'package:movies/firebase_utils/firebase_utils.dart';
import 'package:movies/models/popular_response.dart';

class PopularWidget extends StatefulWidget {

  List<Results> results;

  PopularWidget(this.results);

  @override
  _PopularWidgetState createState() => _PopularWidgetState();
}

class _PopularWidgetState extends State<PopularWidget> {
  bool isAddedToWatchlist=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          child: Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${widget.results[2].posterPath}',fit: BoxFit.fill,),
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
                child: Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${widget.results[0].posterPath}',fit: BoxFit.cover,height: 170,width: 120,),
              ),
              InkWell(
                  child: Image.asset(isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',height: 40,width: 30,),
                onTap: (){
                  addWatchList(widget.results[0].title,widget.results[0].posterPath,widget.results[0].releaseDate,context);
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 150,top: 200),
          child: Text(widget.results[1].title ,  style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 220,left: 150),
          child: Text(widget.results[1].releaseDate,  style: TextStyle(
            color: Colors.white, fontSize: 10, ),),
        ),
      ],
    );
  }

  void addWatchList(String title,String imgUrl,String publishDate,context) {
    addWatchlistToFirebase(title,imgUrl,publishDate).then((value) {
      setState(() {
        isAddedToWatchlist=true;
      });

    }).onError((error, stackTrace) {
      print('erorrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
    }).timeout(Duration(seconds: 30), onTimeout: () {
      print('timeout');
    });
  }
}
