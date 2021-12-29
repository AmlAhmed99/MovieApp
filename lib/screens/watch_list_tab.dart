import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:movies/widgets/searchItem.dart';
import 'package:movies/widgets/watchlist.dart';

class WatchListTab extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('watchlist').snapshots();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 15),
          child: Text(
            'WatchList ',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: MyThemeData.gray,
                  );
                },
                itemBuilder: (context, index) {
                  DocumentSnapshot mytransaction = snapshot.data.docs[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: snapshot.data.docs.length==0?Text("empty WatchList Items") :watchlist(mytransaction));
                },
                itemCount: snapshot.data.docs.length,
              ),
            );
          },
        ),

      ],
    );
  }
}
