import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/screens/write_review/write_review_screen.dart';

import 'models/movie.dart';
import 'screens/login/login_screen.dart';

class LoginCheck extends StatelessWidget {
  final Movie movie;

  const LoginCheck({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if(!snapshot.hasData) return LoginScreen();
        else return WriteReviewScreen(movie: movie);
      },
    );
  }
}
