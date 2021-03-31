import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(String title) {
  return AppBar(
    toolbarHeight: Get.size.height * 0.1,
    elevation: 0.0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(title, style: TextStyle(color: Colors.black)),
  );
}
