import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
 const MovieModel(
      {required super.id,
      required super.backdropPath,
      required super.title,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String,dynamic> jsonData) {
    return MovieModel(
        id:jsonData ['id'],
        backdropPath:jsonData ['backdrop_path'],
        title:jsonData ['title'],
        genreIds:List<int>.from(jsonData ['genre_ids'].map((e) => e)),
        overview:jsonData ['overview'],
        voteAverage:jsonData ['vote_average'].toDouble(),
        releaseDate:jsonData ['release_date']);
  }
}
