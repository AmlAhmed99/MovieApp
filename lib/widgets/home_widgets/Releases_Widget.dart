
import 'package:flutter/material.dart';
import 'package:movies/firebase_utils/firebase_utils.dart';
import 'package:movies/theme_app/themeApp.dart';

class ReleasesWidget extends StatefulWidget {
  String imageUrl;
  String iconBokemark;
  String title;
  String releaseDate;
  ReleasesWidget({@required this.imageUrl, @required this.iconBokemark,
    @required this.title,@required this.releaseDate});

  @override
  _ReleasesWidgetState createState() => _ReleasesWidgetState();
}

class _ReleasesWidgetState extends State<ReleasesWidget> {
  bool isAddedToWatchlist=false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${widget.imageUrl}'),
          InkWell( child: Image.asset(isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',),
            onTap: (){
              addWatchList(widget.title,widget.imageUrl,widget.releaseDate,context);
            },
          )
        ],
      ),

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
