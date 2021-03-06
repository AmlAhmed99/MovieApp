import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Bloc/Cubit.dart';
import 'package:movies/Bloc/States.dart';
import 'package:movies/home_layout/SplashScreen.dart';
import 'package:movies/home_layout/home_layout.dart';
import 'package:movies/screens/browseCategory/categoryDetails.dart';
import 'package:movies/theme_app/themeApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_tabs/movie_detials.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder:(context,state){
          return MaterialApp(
            theme: ThemeApp.themeData,
            routes: {
              homeScreen.routeName:(buildcontext)=>homeScreen(),
              MovieDetials.routeMovieDetials:(buildContext)=>MovieDetials(),
              SplashScreen.SplashScreenRoute:(buildContext)=>SplashScreen(),
              CategoryDetails.CategoryDetailsRoute:(buildContext)=>CategoryDetails(),
            },
            initialRoute: SplashScreen.SplashScreenRoute,
            debugShowCheckedModeBanner: false,
          );
        } ,
      ),
    );
  }
}