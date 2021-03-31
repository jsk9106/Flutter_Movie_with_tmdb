import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';

import '../../login_check.dart';
import 'components/body.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(movie: movie),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => LoginCheck(movie: movie)),
        backgroundColor: kButtonColor,
        child: Icon(Icons.rate_review, color: Colors.white),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(movie.title, style: TextStyle(fontSize: 16)),
      // toolbarHeight: Get.size.height * 0.08,
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
    );
  }
}
