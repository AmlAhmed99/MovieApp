import 'package:movies/models/messegeAndCode.dart';

/// adult : false
/// backdrop_path : null
/// belongs_to_collection : null
/// budget : 0
/// genres : []
/// homepage : "https://www.lafuriafilm.com/oleg"
/// id : 915482
/// imdb_id : null
/// original_language : "en"
/// original_title : "L’Estasi di Oleg"
/// overview : "OLEG is a painter; KLAUS is his art dealer.\r After a disastrous first art show, Oleg decides to disappear to an old family home in the mountains in hopes of finding the inspiration that has long escaped him."
/// popularity : 0.0
/// poster_path : null
/// production_companies : []
/// production_countries : []
/// release_date : ""
/// revenue : 0
/// runtime : 19
/// spoken_languages : []
/// status : "Released"
/// tagline : ""
/// title : "L’Estasi di Oleg"
/// video : false
/// vote_average : 0.0
/// vote_count : 0
class Latest_response extends MessageCode{
  Latest_response({
    bool adult,
    dynamic backdropPath,
    dynamic belongsToCollection,
    int budget,
    List<dynamic> genres,
    String homepage,
    int id,
    dynamic imdbId,
    String originalLanguage,
    String originalTitle,
    String overview,
    num popularity,
    dynamic posterPath,
    List<dynamic> productionCompanies,
    List<dynamic> productionCountries,
    String releaseDate,
    int revenue,
    int runtime,
    List<dynamic> spokenLanguages,
    String status,
    String tagline,
    String title,
    bool video,
    num voteAverage,
    int voteCount,}){
    _adult = adult;
    _backdropPath = backdropPath;
    _belongsToCollection = belongsToCollection;
    _budget = budget;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _releaseDate = releaseDate;
    _revenue = revenue;
    _runtime = runtime;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  Latest_response.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _belongsToCollection = json['belongs_to_collection'];
    _budget = json['budget'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres.add(Latest_response.fromJson(v));
      });
    }
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies.add(Latest_response.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries.add(Latest_response.fromJson(v));
      });
    }
    _releaseDate = json['release_date'];
    _revenue = json['revenue'];
    _runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages.add(Latest_response.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool _adult;
  dynamic _backdropPath;
  dynamic _belongsToCollection;
  int _budget;
  List<dynamic> _genres;
  String _homepage;
  int _id;
  dynamic _imdbId;
  String _originalLanguage;
  String _originalTitle;
  String _overview;
  num _popularity;
  dynamic _posterPath;
  List<dynamic> _productionCompanies;
  List<dynamic> _productionCountries;
  String _releaseDate;
  int _revenue;
  int _runtime;
  List<dynamic> _spokenLanguages;
  String _status;
  String _tagline;
  String _title;
  bool _video;
  num _voteAverage;
  int _voteCount;

  bool get adult => _adult;
  dynamic get backdropPath => _backdropPath;
  dynamic get belongsToCollection => _belongsToCollection;
  int get budget => _budget;
  List<dynamic> get genres => _genres;
  String get homepage => _homepage;
  int get id => _id;
  dynamic get imdbId => _imdbId;
  String get originalLanguage => _originalLanguage;
  String get originalTitle => _originalTitle;
  String get overview => _overview;
  num get popularity => _popularity;
  dynamic get posterPath => _posterPath;
  List<dynamic> get productionCompanies => _productionCompanies;
  List<dynamic> get productionCountries => _productionCountries;
  String get releaseDate => _releaseDate;
  int get revenue => _revenue;
  int get runtime => _runtime;
  List<dynamic> get spokenLanguages => _spokenLanguages;
  String get status => _status;
  String get tagline => _tagline;
  String get title => _title;
  bool get video => _video;
  num get voteAverage => _voteAverage;
  int get voteCount => _voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['belongs_to_collection'] = _belongsToCollection;
    map['budget'] = _budget;
    if (_genres != null) {
      map['genres'] = _genres.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['imdb_id'] = _imdbId;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] = _productionCompanies.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] = _productionCountries.map((v) => v.toJson()).toList();
    }
    map['release_date'] = _releaseDate;
    map['revenue'] = _revenue;
    map['runtime'] = _runtime;
    if (_spokenLanguages != null) {
      map['spoken_languages'] = _spokenLanguages.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}