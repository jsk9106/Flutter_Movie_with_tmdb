import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_tmdb/components/custom_button.dart';
import 'package:flutter_movie_tmdb/components/rating.dart';
import 'package:flutter_movie_tmdb/constants.dart';
import 'package:flutter_movie_tmdb/models/movie.dart';
import 'package:flutter_movie_tmdb/models/review.dart';
import 'package:flutter_movie_tmdb/screens/detail/components/poster_card.dart';
import 'package:flutter_movie_tmdb/screens/detail/components/reviewCard.dart';
import 'package:flutter_movie_tmdb/screens/detail/components/reviewConunt.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  final Movie movie;

  const Body({Key key, @required this.movie}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Review> reviews = [];
  bool more = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: kPrimaryColor,
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('reviews')
            .where('movie_title', isEqualTo: widget.movie.title)
            .orderBy('write_time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return buildListView(snapshot.data.docs);
        },
      ),
    );
  }

  ListView buildListView(List<DocumentSnapshot> snapshot) {
    reviews = snapshot.map((d) => Review.fromSnapshot(d)).toList();
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: reviews.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) return movieCard();
        if (index == 1) return reviewCount(reviews);
        return reviewCard(reviews[index - 2]);
      },
    );
  }

  Widget movieCard() {
    return Container(
      height: Get.size.height - 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          descriptionCard(),
          posterCard(widget.movie),
        ],
      ),
    );
  }

  Positioned descriptionCard() {
    return Positioned(
      top: Get.size.height * 0.14,
      left: 0,
      right: 0,
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
    );
  }
}
