import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/controller/review_write_controller.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

import '../../../constants.dart';
import 'build_poster.dart';

class Body extends StatefulWidget {
  final Movie movie;

  const Body({Key key, @required this.movie}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ReviewWriteController controller = Get.put(ReviewWriteController());
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPoster(widget.movie),
            SizedBox(height: 20),
            buildInputCard(),
            SizedBox(height: 30),
            buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  FlatButton buildSubmitButton() {
    return FlatButton(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: kPrimaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              if(controller.textEditingController.text == '') return Get.snackbar('알림', '빈 리뷰는 작성하실 수 없습니다.', colorText: Colors.white, backgroundColor: kButtonColor.withOpacity(0.5));
              controller.submit(movieTitle: widget.movie.title, rating: rating);
            },
            child: Text('리뷰작성'),
          );
  }

  Container buildInputCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      height: Get.size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            '${widget.movie.title} 리뷰쓰기',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Divider(height: 30, thickness: 1),
          Expanded(
            child: TextField(
              controller: controller.textEditingController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              maxLength: 100,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '리뷰 100자 이하',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
              ),
            ),
          ),
          SizedBox(height: 10),
          GFRating(
            value: rating,
            onChanged: (value) {
              setState(() => rating = value.toPrecision(1));
              print(rating);
            },
          ),
        ],
      ),
    );
  }
}
