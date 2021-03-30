import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/screens/movie_list/movie_list_screen.dart';
import 'package:get/get.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MovieApp with tmdb',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kScaffoldColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieListScreen(),
    );
  }
}


