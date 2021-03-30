class Movie {
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final voteAverage;
  final List genre;
  final String releaseDate;

  Movie({
      this.title,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.genre,
      this.releaseDate
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        overview = json['overview'],
        posterPath = 'https://image.tmdb.org/t/p/w500' + json['poster_path'],
        backdropPath = 'https://image.tmdb.org/t/p/w500' + json['backdrop_path'],
        voteAverage = json['vote_average'],
        genre = json['genre_ids'],
        releaseDate = json['release_date'];
}
