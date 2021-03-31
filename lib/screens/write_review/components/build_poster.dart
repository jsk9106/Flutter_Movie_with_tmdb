import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';

import '../../../constants.dart';

Center buildPoster(Movie movie) {
  return Center(
    child: Container(
      width: 150,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 10,
            color: kPrimaryColor.withOpacity(0.3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          width: 150,
          imageUrl: movie.posterPath,
          placeholder: (context, url) => Container(color: Colors.grey[200]),
          errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
        ),
      ),
    ),
  );
}