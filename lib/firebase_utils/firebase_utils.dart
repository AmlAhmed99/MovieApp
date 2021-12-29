import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/watchlist_model.dart';

CollectionReference<Watchlist> getWatchlistRefWithConverter() {
  return FirebaseFirestore.instance
      .collection(Watchlist.collectionName)
      .withConverter<Watchlist>(
    fromFirestore: (snapshot, _) => Watchlist.fromJson(snapshot.data()),
    toFirestore: (todo, _) => todo.toJson(),
  );
}

Future<void> addWatchlistToFirebase(String title, String imgUrl, String publishedAt) {
  DocumentReference<Watchlist> docRef = getWatchlistRefWithConverter().doc();
  Watchlist watchlist = Watchlist(
      id: docRef.id,
      title: title,
    posterPath: "https://www.themoviedb.org/t/p/w220_and_h330_face"+imgUrl,
    releaseDate: publishedAt

  );
  return docRef.set(watchlist);
}