import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:flutter_movie_tmdb/controller/movie_list_controller.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:flutter_movie_tmdb/screens/detail/detail_screen.dart';
import 'package:get/get.dart';

import 'movie_description.dart';
import 'movie_poster.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final MovieListController controller = Get.put(MovieListController());

  @override
  void initState() {
    super.initState();
    controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.movies == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: ListView.builder(
                controller: controller.scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: controller.movies.length + 1,
                itemBuilder: (context, index) {
                  if (index == controller.movies.length) {
                    if (index == 10000) {
                      return Center(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text('마지막 영화입니다.')));
                    }
                    return Center(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: CircularProgressIndicator()));
                  }
                  return buildMovieListItem(controller.movies[index]);
                },
              ),
            ),
    );
  }
}

Widget buildMovieListItem(Movie movie) {
  return GestureDetector(
    onTap: () => Get.to(() => DetailScreen(movie: movie)),
    child: Container(
      height: 170,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [kDefaultShadow],
      ),
      child: Row(
        children: [
          moviePoster(movie),
          SizedBox(width: 15),
          movieDescription(movie),
        ],
      ),
    ),
  );
}
