import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/components/custom_button.dart';
import 'package:flutter_movie_tmdb/components/rating.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  final Movie movie;

  const Body({Key key, @required this.movie}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool more = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: kPrimaryColor),
        descriptionCard(),
        Positioned(
          top: Get.size.height * 0.02,
          child: Container(
            height: 160,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(widget.movie.posterPath),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: kPrimaryColor.withOpacity(0.3),
                )
              ]
            ),
          ),
        ),
      ],
    );
  }

  Positioned descriptionCard() {
    return Positioned(
        top: Get.size.height * 0.14,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 20),
            height: Get.size.height * 0.65,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    widget.movie.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.movie.releaseDate.substring(0, 4),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  SizedBox(height: 40),
                  rating(
                    rating: widget.movie.voteAverage,
                    fontSize: 22,
                    iconSize: 26,
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '개봉일: ${widget.movie.releaseDate}',
                      style: TextStyle(color: Colors.grey[700], fontSize: 13),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.movie.overview,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                    maxLines: more ? 100 : 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 40),
                  more
                      ? Container()
                      : customButton(
                          'More',
                          () {
                            setState(() {
                              more = true;
                            });
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}
