import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_movies.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetails getMovieDetails;
  final GetRecommendationMovies getRecommendationMovies;
  MovieDetailsBloc(this.getMovieDetails, this.getRecommendationMovies)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetails(MovieDetailsParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l.message, movieDetailsState: RequestState.error)),
        (r) => emit(state.copyWith(
            movieDetail: r, movieDetailsState: RequestState.loaded)));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
   final result =
        await getRecommendationMovies(RecommendationParameters(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationMessage: l.message, recommendationState: RequestState.error)),
        (r) => emit(state.copyWith(
            recommendation: r, recommendationState: RequestState.loaded)));

  }
}
