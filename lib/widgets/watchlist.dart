import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/models/popular_response.dart';

class watchlist extends StatelessWidget {
  DocumentSnapshot results;

  watchlist(this.results);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face${results['poster_path']}',height: 180,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(results['title'],style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),
                Text(results['release_date'],style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 2,),
              ],
            ),
          )

        ],
      ),
    );
  }
}
