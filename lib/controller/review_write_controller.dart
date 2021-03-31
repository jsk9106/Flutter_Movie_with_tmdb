import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:get/get.dart';

class ReviewWriteController extends GetxController{
  final TextEditingController textEditingController = TextEditingController();
  User currentUser = FirebaseAuth.instance.currentUser;

  Future<void> submit({String movieTitle, double rating}) async{
    try{
      await FirebaseFirestore.instance.collection('reviews').add({
        'uid': currentUser.uid,
        'content': textEditingController.text,
        'rating': rating,
        'image_url': currentUser.photoURL,
        'movie_title': movieTitle,
        'write_time': DateTime.now(),
      });
      Get.back();
      Get.snackbar('알림', '리뷰 작성 완료', colorText: Colors.white, backgroundColor: kButtonColor.withOpacity(0.5));
    }
    catch(err){
      print(err);
    }

  }
}