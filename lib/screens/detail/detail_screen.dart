import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(movie: movie),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(movie.title, style: TextStyle(fontSize: 16),),
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
    );
  }
}
