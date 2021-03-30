import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

Widget customButton(String text, Function press) {
  return GestureDetector(
    onTap: press,
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      width: Get.size.width * 0.7,
      height: 50,
      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ),
  );
}