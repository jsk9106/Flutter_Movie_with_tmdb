import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

import '../constants.dart';

Row rating({double rating, double fontSize, double iconSize}) {
  return Row(
    children: [
      Text(
        rating.toString().substring(0, 3),
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 10),
      GFRating(
        value: rating - 0.1,
        color: kPrimaryColor,
        size: iconSize,
      )
    ],
  );
}