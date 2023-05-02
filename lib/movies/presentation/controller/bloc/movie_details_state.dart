part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String message;
  final List<Recommendation>? recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.message = '',
      this.recommendation,
      this.recommendationState = RequestState.loading,
      this.recommendationMessage = ''});

  @override
  List<Object> get props => [
        movieDetails!,
        movieDetailsState,
        message,
        recommendation!,
        recommendationState,
        recommendationMessage
      ];

  MovieDetailsState copyWith(
      {MovieDetails? movieDetails,
      RequestState? movieDetailsState,
      String? message,
      List<Recommendation>? recommendation,
      RequestState? recommendationState,
      String? recommendationMessage}) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        message: message ?? this.message,
        recommendation: recommendation ?? this.recommendation,
        recommendationState: recommendationState ?? this.recommendationState,
        recommendationMessage:
            recommendationMessage ?? this.recommendationMessage);
  }
}
//class MovieDetailsInitial extends MovieDetailsState {}
