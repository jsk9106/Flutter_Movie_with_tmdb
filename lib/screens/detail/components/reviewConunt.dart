import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/review.dart';

Widget reviewCount(List<Review> reviews) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text('review ${reviews.length.toString()}',
        style: TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300)),
  );
}