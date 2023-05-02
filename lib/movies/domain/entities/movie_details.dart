import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final String voteAverage;
  final int id;
  final int runtime;
  final List<Genres> genres;

  const MovieDetails(
      {required this.backdropPath,
      required this.title,
      required this.overview,
      required this.releaseDate,
      required this.voteAverage,
      required this.id,
      required this.runtime,
      required this.genres
      });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [backdropPath, title, overview, releaseDate, voteAverage, id, runtime,genres];
}
