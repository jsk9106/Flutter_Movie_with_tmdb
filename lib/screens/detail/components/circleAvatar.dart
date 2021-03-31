import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/review.dart';

CircleAvatar circleAvatar(Review review) {
  return CircleAvatar(
      backgroundImage: review.imageUrl == null
          ? Image.network(
              'https://www.freeiconspng.com/thumbs/login-icon/user-login-icon-14.png')
          : Image.network(review.imageUrl).image,
      backgroundColor: Colors.grey[200]);
}
