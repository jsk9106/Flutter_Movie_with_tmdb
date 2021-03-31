import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/components/rating.dart';
import 'package:flutter_movie_tmdb/models/review.dart';
import 'package:flutter_movie_tmdb/screens/detail/components/circleAvatar.dart';
import 'package:intl/intl.dart';

Widget reviewCard(Review review) {
  String writeTime = DateFormat('yyyy-MM-dd').format(review.writeTime.toDate());
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    height: 200,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              circleAvatar(review),
              SizedBox(width: 30),
              rating(
                fontSize: 24,
                iconSize: 20,
                rating: review.rating,
              ),
            ],
          ),
          Divider(height: 30, thickness: 1),
          Expanded(
            child: Text(
              review.content,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              writeTime,
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
        ],
      ),
    ),
  );
}
