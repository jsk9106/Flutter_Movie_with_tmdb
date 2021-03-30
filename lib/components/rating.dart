import 'package:flutter/material.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

import '../constants.dart';

Row rating({var rating, double fontSize, double iconSize}) {
  return Row(
    children: [
      Text(
        rating.toString(),
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(width: 15),
      GFRating(
        value: (rating / 10) * 5,
        color: kPrimaryColor,
        size: iconSize,
      )
    ],
  );
}