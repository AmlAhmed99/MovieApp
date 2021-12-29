import 'package:movies/models/popular_response.dart';

import 'messegeAndCode.dart';

/// page : 1
/// results : [{"adult":false,"backdrop_path":"/8RKBHHRqOMOLh5qW3sS6TSFTd8h.jpg","genre_ids":[28,878,12],"id":399579,"original_language":"en","original_title":"Alita: Battle Angel","overview":"When Alita awakens with no memory of who she is in a future world she does not recognize, she is taken in by Ido, a compassionate doctor who realizes that somewhere in this abandoned cyborg shell is the heart and soul of a young woman with an extraordinary past.","popularity":61.129,"poster_path":"/xRWht48C2V8XNfzvPehyClOvDni.jpg","release_date":"2019-01-31","title":"Alita: Battle Angel","video":false,"vote_average":7.2,"vote_count":7095},{"adult":false,"backdrop_path":"/qb4bm2nPDJQILkWsiAQggrXvxtd.jpg","genre_ids":[16,28,878],"id":17189,"original_language":"ja","original_title":"銃夢 -GUNNM-","overview":"In his travels as a bounty hunter, Hunter-Warrior and cyborg healer Ido one day discovers and repairs the remnants of a cyborg whom he names Gally. Though possessing the body of a young woman, Gally now embodies Ido's most sophisticated and lethal cybernetic skills. The preternaturally strong, amnesiac Gally begins to forge a life for herself in a world where every day is a struggle for survival.","popularity":25.022,"poster_path":"/urvznwew7HrjrIEbK2RLaEkaezs.jpg","release_date":"1993-06-21","title":"Battle Angel","video":false,"vote_average":6.8,"vote_count":143},{"adult":false,"backdrop_path":null,"genre_ids":[16],"id":727664,"original_language":"zh","original_title":"阿莉塔的试炼","overview":"The last dragon and the strongest knight are unable to destroy each other and decide to make a bet to determine the winner","popularity":0.6,"poster_path":"/bZ0ygTYi8xknaIusXtxOHgyB2OY.jpg","release_date":"2016-10-27","title":"Alita's Trial","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":"/8qo2cdcsqCpKRDSE0MZlrinJXUQ.jpg","genre_ids":[35],"id":587429,"original_language":"es","original_title":"Dulce familia","overview":"A fat woman attempts to lose weight in order to use her mother's wedding dress with the help of  her evil sisters and needy fiancé.","popularity":8.633,"poster_path":"/3lyaM4QT30eh7ok0hBb13UtWoY.jpg","release_date":"2019-05-10","title":"Sweet Family","video":false,"vote_average":7.6,"vote_count":95},{"adult":false,"backdrop_path":"/46FFUHTGP3KreeXkG0pCYm6GUP6.jpg","genre_ids":[18],"id":252469,"original_language":"tl","original_title":"Ang Alitaptap","overview":"A short film made for \"Venezia 70 - Future Reloaded.\"","popularity":1.845,"poster_path":"/6aaeMh6VjS14ZCRnOXxZQ3sR6Rl.jpg","release_date":"2013-07-31","title":"Ang Alitaptap","video":false,"vote_average":7.3,"vote_count":3},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":504715,"original_language":"tl","original_title":"Facundo Alitaftaf","overview":"A homeless woman died giving birth to her twin sons. One of the twins, Alitaftaf is adopted by a poor couple while the other, Facundo, is adopted by a middle class couple. The twins grew up in a contrasting lifestyle, so they both build different personalities. Alitaftaf has difficulty speaking, but is good-hearted while Facundo is spoiled and naughty.","popularity":0.6,"poster_path":"/6U1nmP3qqnP6D7G3tJvLzdakzfM.jpg","release_date":"1978-04-20","title":"Facundo Alitaftaf","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[16],"id":815287,"original_language":"es","original_title":"Como Alitas de Chincol","overview":"An animated homage to the “arpilleras”, women that knitted history in Chile during the dictatorship.","popularity":0.6,"poster_path":"/zKJcRmZuY3s2XyPgXJmDe307y8U.jpg","release_date":"2002-01-07","title":"Like Wings of Little Birds","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[99],"id":413835,"original_language":"ar","original_title":"Kharej Al-Itar aw Thawra Hata el Nasser","overview":"A unique historical portrait of the Palestinian people's struggle to produce their own image. Using material long hidden in archives across the globe, the film reaches back through the modern history of Palestine and reverses decades of colonial dominance with a mosaic of struggle from the perspective of the colonized.","popularity":0.6,"poster_path":"/VRVEFfUmgZALJg5Pe2gNmrgQmW.jpg","release_date":"2016-09-10","title":"Off Frame AKA Revolution Until Victory","video":false,"vote_average":5.5,"vote_count":4}]
/// total_pages : 1
/// total_results : 8

class Search_response  extends MessageCode {
  Search_response({
      int page, 
      List<Results> results, 
      int totalPages, 
      int totalResults,}){
    _page = page;
    _results = results;
    _totalPages = totalPages;
    _totalResults = totalResults;
}

  Search_response.fromJson(dynamic json) {
    _page = json['page'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results.add(Results.fromJson(v));
      });
    }
    _totalPages = json['total_pages'];
    _totalResults = json['total_results'];
  }
  int _page;
  List<Results> _results;
  int _totalPages;
  int _totalResults;

  int get page => _page;
  List<Results> get results => _results;
  int get totalPages => _totalPages;
  int get totalResults => _totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    if (_results != null) {
      map['results'] = _results.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = _totalPages;
    map['total_results'] = _totalResults;
    return map;
  }

}

/// adult : false
/// backdrop_path : "/8RKBHHRqOMOLh5qW3sS6TSFTd8h.jpg"
/// genre_ids : [28,878,12]
/// id : 399579
/// original_language : "en"
/// original_title : "Alita: Battle Angel"
/// overview : "When Alita awakens with no memory of who she is in a future world she does not recognize, she is taken in by Ido, a compassionate doctor who realizes that somewhere in this abandoned cyborg shell is the heart and soul of a young woman with an extraordinary past."
/// popularity : 61.129
/// poster_path : "/xRWht48C2V8XNfzvPehyClOvDni.jpg"
/// release_date : "2019-01-31"
/// title : "Alita: Battle Angel"
/// video : false
/// vote_average : 7.2
/// vote_count : 7095

