import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/models/popular_response.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/search_response.dart';
import 'package:movies/models/similar_response.dart';
import 'package:movies/models/toprated_response.dart';
import 'dart:convert';
import 'package:movies/models/categort_details.dart';
import 'package:movies/models/category_response.dart';
import 'package:movies/models/details_response.dart';
import 'package:movies/models/latest_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/models/watchlist_model.dart';
class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  static const apiKey='76c10f5efbc98f79bdf6af47c53a5659';

   Future<Popular_response> apiLoadPopular() async{
    var parametars={
      'api_key':apiKey,

    };
    var uri=Uri.https("api.themoviedb.org", "/3/movie/popular",parametars);

    var response= await http.get(uri);
    var popularResponce=Popular_response.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccessPopularResponseState());
      return popularResponce;

    }
    else{
      emit(ErrorPopularResponseState());
      if(popularResponce.message!=null)
        throw Exception(popularResponce.message);
      else throw Exception("error loading popular movies");

    }

  }

   Future<Latest_response> apiLoadLatest() async{
    var parametars={
      'api_key':apiKey,

    };
    var uri=Uri.https("api.themoviedb.org", "/3/movie/latest",parametars);

    var response= await http.get(uri);
    var latestResponse=Latest_response.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
     emit(SuccessLatestResponseState());
      return latestResponse;
    }
    else{
      emit(ErrorLatestResponseState());
      if(latestResponse.message!=null)
        throw Exception(latestResponse.message);
      else throw Exception("error loading popular movies");

    }


  }

   Future<toprated_response> apiLoadToprated() async{
    var parametars={
      'api_key':apiKey,
    };
    var uri=Uri.https("api.themoviedb.org", "/3/movie/top_rated",parametars);

    var response= await http.get(uri);
    var topratedResponse=toprated_response.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccesstopratedResponseState());
      return topratedResponse;
    }
    else{
      emit(SuccesstopratedResponseState());
      if(topratedResponse.message!=null)
        throw Exception(topratedResponse.message);
      else throw Exception("error loading popular movies");

    }


  }

   Future<Details_response> apiLoadDetails(int movie_id) async{
    var parametars={
      'api_key':apiKey,
    };
    var uri=Uri.https("api.themoviedb.org", "/3/movie/${movie_id}",parametars);

    var response= await http.get(uri);
    var DetailsResponse=Details_response.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccessDetailsResponseState());
      return DetailsResponse;
    }
    else{
      emit(SuccessDetailsResponseState());
      if(DetailsResponse.message!=null)
        throw Exception(DetailsResponse.message);
      else throw Exception("error loading popular movies");

    }


  }

   Future<Similar_response> apiLoadSimilar(int movie_id) async{
    var parametars={
      'api_key':apiKey,
    };
    var uri=Uri.https("api.themoviedb.org", "/3/movie/${movie_id}/similar",parametars);

    var response= await http.get(uri);
    var SimilarResponse=Similar_response.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccessSimilarResponseState());
      return SimilarResponse;
    }
    else{
      emit(SuccessSimilarResponseState());
      if(SimilarResponse.message!=null)
        throw Exception(SimilarResponse.message);
      else throw Exception("error loading popular movies");

    }


  }

   Future<Search_response> apiSearch(String query) async{
    var parametars={
      'api_key':apiKey,
      'query':query
    };
    var uri=Uri.https("api.themoviedb.org","/3/search/movie",parametars);

    var response= await http.get(uri);
    var SearchResponse=Search_response.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccessSearchResponseState());
      return SearchResponse;
    }
    else{
      emit(SuccessSearchResponseState());
      if(SearchResponse.message!=null)
        throw Exception(SearchResponse.message);
      else throw Exception("Please type your movie name to start searching");

    }


  }

   Future<CategoryResponse> apiCategory() async{
     var parametars={
      'api_key':apiKey,

    };
    var uri=Uri.https("api.themoviedb.org", "/3/genre/movie/list",parametars);

    var response= await http.get(uri);
    var categoryResponce=CategoryResponse.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccessCategoryResponseState());
      return categoryResponce;
    }
    else{
      emit(SuccessCategoryResponseState());

      if(categoryResponce.message!=null)
        throw Exception(categoryResponce.message);
      else throw Exception("error loading popular movies");

    }


  }

   Future<CategortDetailsRespose> apiCategoryDetailsFilter() async{
    var parametars={
      'api_key':apiKey,

    };
    var uri=Uri.https("api.themoviedb.org", "/3/discover/movie",parametars);

    var response= await http.get(uri);
    var categoryDetailsResponce=CategortDetailsRespose.fromJson(jsonDecode(response.body));

    if(response.statusCode==200)
    {
      emit(SuccessCategortDetailsResponseState());
      return categoryDetailsResponce;
    }
    else{
      emit(SuccessCategortDetailsResponseState());
      if(categoryDetailsResponce.message!=null)
        throw Exception(categoryDetailsResponce.message);
      else throw Exception("error loading popular movies");

    }


  }

   bool GenerIdIsFound(List<Results>list,int id){
    for(int i=0;i<list.length;i++)
    {
      for(int j=0;j<list[i].genreIds.length;j++)
        if(id==list[i].genreIds[j])
          return true;
      return false;
    }
    emit(GenerIdIsFoundState());
  }
  String query;
  void onChangeFun(q){
    query=q;
    emit(onChangeFunState());
  }



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
  bool isAddedToWatchlist=false;
  void addWatchList(String title,String imgUrl,String publishDate,context) {
    addWatchlistToFirebase(title,imgUrl,publishDate).then((value) {
        isAddedToWatchlist=true;
        emit(SuccessaddWatchListState());

    }).onError((error, stackTrace) {
      emit(ErroraddWatchListState());
      print('erorrrrrrrrrrrrrrrrrrrrrrrrrrr${error.toString()}');
    }).timeout(Duration(seconds: 30), onTimeout: () {
      print('timeout');
    });
  }






}