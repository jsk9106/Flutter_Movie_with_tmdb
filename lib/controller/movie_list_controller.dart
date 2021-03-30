import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MovieListController extends GetxController{
  final ScrollController scrollController = ScrollController();
  int page = 1;
  RxList<dynamic> movies = [].obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        page++;
        fetchData();
      }
    });
  }

  @override
  void onClose(){
    super.onClose();
    scrollController.dispose();
  }

  Future<void> fetchData() async{
    if(page > 50){
      return;
    }

    String url = 'https://api.themoviedb.org/3/movie/popular?api_key=2665d2776a3a52a505d0ea4584a81f23&language=ko&page=$page';
    try{
      http.Response response = await http.get(url);

      var body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      result.forEach((item) {
        movies.add(Movie.fromJson(item));
      });

    } catch(err){
      Get.snackbar('error', '데이터 로드 실패');
    }

  }
}