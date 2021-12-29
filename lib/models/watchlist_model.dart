class Watchlist {
  static const String collectionName = 'watchlist';
  Watchlist({
    String id,
    String posterPath,
    String releaseDate,
    String title,
   }){

    _id = id;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;

  }
  Watchlist.fromJson(dynamic json) {
    _id = json['id'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
  }
  String _id;
  String _posterPath;
  String _releaseDate;
  String _title;


  String get id => _id;

  String get posterPath => _posterPath;
  String get releaseDate => _releaseDate;
  String get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['title'] = _title;

    return map;
  }

}