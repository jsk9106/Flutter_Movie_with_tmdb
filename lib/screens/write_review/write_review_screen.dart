import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class WriteReviewScreen extends StatelessWidget {
  final Movie movie;

  const WriteReviewScreen({Key key, @required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(movie: movie),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(movie.title, style: TextStyle(fontSize: 16)),
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () => Get.back()),
      actions: [
        IconButton(icon: Icon(Icons.logout), onPressed: () => FirebaseAuth.instance.signOut())
      ],
    );
  }
}
