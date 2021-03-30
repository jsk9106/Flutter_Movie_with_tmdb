import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';

Widget moviePoster(Movie movie) {
  return Container(
    width: 100,
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: CachedNetworkImageProvider(
            movie.posterPath
        ),
        fit: BoxFit.cover
      ),
    ),
    // child: CachedNetworkImage(
    //   width: 100,
    //   imageUrl: movie.posterPath == null
    //       ? "https://www.freeiconspng.com/thumbs/login-icon/user-login-icon-14.png"
    //       : movie.posterPath,
    //   fit: BoxFit.cover,
    //   placeholder: (context, url) => Container(color: Colors.grey[200]),
    //   errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
    // ),
  );
}