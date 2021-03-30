import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/components/rating.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';

import '../../../constants.dart';

Expanded movieDescription(Movie movie) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 5),
        Text(
          movie.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          movie.releaseDate.substring(0, 4),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        Spacer(),
        Text(
          movie.overview,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        rating(
          rating: movie.voteAverage,
          fontSize: 20,
          iconSize: 18,
        ),
        SizedBox(height: 5),
      ],
    ),
  );
}