import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:flutter_movie_tmdb/privacy.dart';
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

  // 영화 정보 불러오기
  Future<void> fetchData() async{
    if(page > 50){ // 총 페이지 수를 넘긴다면 그냥 리턴
      return;
    }

    String url = 'https://api.themoviedb.org/3/movie/popular?api_key=$key&language=ko&page=$page';
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