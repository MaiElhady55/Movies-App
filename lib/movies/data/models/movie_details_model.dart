import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.title,
      required super.overview,
      required super.releaseDate,
      required super.voteAverage,
      required super.id,
      required super.runtime,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> jsonData) {
    return MovieDetailsModel(
        backdropPath:jsonData ['backdrop_path'],
        title:jsonData ['title'],
        overview:jsonData ['overview'],
        releaseDate:jsonData ['release_date'],
        voteAverage:jsonData ['vote_average'].toDouble(),
        id:jsonData ['id'],
        runtime:jsonData ['runtime'],
        genres: List<GenresModel>.from(jsonData['genres'].map((e)=>GenresModel.fromJson(e))));
  }
}
