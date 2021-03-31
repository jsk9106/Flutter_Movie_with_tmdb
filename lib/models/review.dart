import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  final String uid;
  final String content;
  final double rating;
  final String imageUrl;
  final String movieTitle;
  final Timestamp writeTime;

  Review(this.uid, this.content, this.rating, this.imageUrl, this.movieTitle, this.writeTime);


  Review.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());

  Review.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        content = map['content'],
        rating = map['rating'],
        imageUrl = map['image_url'],
        movieTitle = map['movie_title'],
        writeTime = map['write_time'];
}