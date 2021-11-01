import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Movies {
  List<Movie>? items = [];
  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList.isNotEmpty) {
      for (var item in jsonList) {
        final movie = Movie.fromJsonMap(item);
        items!.add(movie);
      }
    }
  }
}

class Movie {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Movie({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  String getPosterImg() {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    } else {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    }
  }

  String getBackgroundImg() {
    if (backdropPath != null) {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    } else {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    }
  }

  Color getColorVoteCount() {
    if (voteAverage! >= 8) return Colors.green;
    if (voteAverage! >= 6 && voteAverage! <= 7.9) return Colors.amber;
    if (voteAverage! <= 5.9) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
