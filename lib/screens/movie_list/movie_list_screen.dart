import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/components/custom_app_bar.dart';

import 'components/body.dart';

class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('인기영화'),
      body: Body(),
    );
  }
}
