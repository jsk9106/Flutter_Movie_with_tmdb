import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

Positioned posterCard(Movie movie) {
  return Positioned(
    top: Get.size.height * 0.02,
    child: Container(
      height: 160,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: CachedNetworkImageProvider(movie.posterPath),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10,
              color: kPrimaryColor.withOpacity(0.3),
            )
          ]
      ),
    ),
  );
}