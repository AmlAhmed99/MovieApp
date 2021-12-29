
import 'package:flutter/material.dart';
import 'package:movies/firebase_utils/firebase_utils.dart';
import 'package:movies/theme_app/themeApp.dart';

class DetailsItem extends StatefulWidget {
  String imgUrl;
  String description;
  double rate;
  String releaseDate;
  String title;

  DetailsItem({this.imgUrl, this.description, this.rate,this.releaseDate,this.title});

  @override
  _DetailsItemState createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  bool isAddedToWatchlist=false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 10),
          child: Stack(
            children: [
              Container(
                child: Image.asset('https://www.themoviedb.org/t/p/w220_and_h330_face${widget.imgUrl}',fit: BoxFit.cover,height: 170,width: 120,),
              ),
              InkWell(
                child: Image.asset(isAddedToWatchlist?'assets/bookmarkgold.png':'assets/bookmark.png',),
                onTap: (){
                  addWatchList(widget.title,widget.imgUrl,widget.releaseDate,context);
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
              child: Text('${widget.description}',
                  style: TextStyle(
                    color: Colors.white, fontSize: 13, )),
            ),
            Row(
              children: [
                Icon(Icons.star,color: MyThemeData.Primaty_color,size: 20,),
                Text('${widget.rate}',
                    style: TextStyle(
                        color: Colors.white, fontSize: 18,fontWeight: FontWeight.w500 ))
              ],
            )
          ],
        )
        )
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
