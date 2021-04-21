import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:get/get.dart';

class ReviewWriteController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  User currentUser = FirebaseAuth.instance.currentUser;

  Future<void> submit({String movieTitle, double rating}) async {
    try {
      await FirebaseFirestore.instance.collection('reviews').add({
        'uid': currentUser.uid,
        'content': textEditingController.text,
        'rating': rating,
        'image_url': currentUser.photoURL,
        'movie_title': movieTitle,
        'write_time': DateTime.now(),
      });
      Get.back();
      customSnackBar('리뷰작성 완료');
    } catch (err) {
      print(err);
      customSnackBar('잠시 후 다시 시도해주세요');
    }
  }

  void customSnackBar(String message) {
    Get.snackbar(
      '알림',
      message,
      colorText: Colors.white,
      backgroundColor: kButtonColor.withOpacity(0.5),
    );
  }
}
