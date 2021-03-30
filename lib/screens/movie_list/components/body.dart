import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:flutter_movie_tmdb/repository/movie_repository.dart';
import 'package:flutter_movie_tmdb/screens/detail/detail_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'movie_description.dart';
import 'movie_poster.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController scrollController = ScrollController();
  List<Movie> movies = [];
  int page = 1;
  bool loading = false;

  // Future fetchData() async {
  //   movies = await _movieRepository.loadMovies(page);
  //   print(movies);
  //   return movies;
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() async{
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent) {
  //       if (page > 500) return;
  //       page++;
  //       nextMovie = await _movieRepository.loadMovies(page);
  //       movies = movies + nextMovie;
  //       print('max');
  //     }
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   scrollController.dispose();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //     future: fetchData(),
  //     builder: (context, snapshot) {
  //       if (!snapshot.hasData)
  //         return Center(child: CircularProgressIndicator());
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  //         child: ListView.builder(
  //           controller: scrollController,
  //           physics: BouncingScrollPhysics(),
  //           itemCount: movies.length,
  //           itemBuilder: (context, index) {
  //             Movie movie = movies[index];
  //             return buildMovieListItem(movie);
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> fetchData() async {
    if (page > 50) {
      return;
    }

    String url =
        'https://api.themoviedb.org/3/movie/popular?api_key=2665d2776a3a52a505d0ea4584a81f23&language=ko&page=$page';
    try {
      if (page == 1) {
        setState(() => loading = true);
      }
      http.Response response = await http.get(url);
      if (page == 1) {
        setState(() => loading = false);
      }

      final body = json.decode(response.body);
      List<dynamic> result = body['results'];
      result.forEach((element) {
        movies.add(Movie.fromJson(element));
      });
      setState(() {});
    } catch (err) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                backgroundColor: Colors.red[200],
                title: Text('Fail'),
                content: Text(err.toString()));
          });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(movies.length);
    return loading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: ListView.builder(
              controller: scrollController,
              physics: BouncingScrollPhysics(),
              itemCount: movies.length + 1,
              itemBuilder: (context, index) {
                if (index == movies.length) {
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
                return buildMovieListItem(movies[index]);
              },
            ),
          );
  }
}

Widget buildMovieListItem(Movie movie) {
  return GestureDetector(
    onTap: () => Get.to(DetailScreen(movie: movie)),
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
