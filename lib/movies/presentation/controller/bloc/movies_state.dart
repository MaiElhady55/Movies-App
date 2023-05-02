part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = '',
      this.popularMovies = const [],
      this.popularState = RequestState.loading,
      this.popularMessage = '',
      this.topRatedMovies = const [],
      this.topRatedState = RequestState.loading,
      this.topRatedMessage = ''});

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
        topRatedMovies,
        topRatedState,
        topRatedMessage,
      ];

  MoviesState copyWith({
    final List<Movie>? nowPlayingMovies,
    final RequestState? nowPlayingState,
    final String? nowPlayingMessage,
    final List<Movie>? popularMovies,
    final RequestState? popularState,
    final String? popularMessage,
    final List<Movie>? topRatedMovies,
    final RequestState? topRatedState,
    final String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }
  //@override
  //List<Object> get props => [];
}

/*class MoviesInitialState extends MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesSucessState extends MoviesState {
  final List<Movie> nowPlayingMovies;

   MoviesSucessState({required this.nowPlayingMovies});
}

class MoviesFailerState extends MoviesState {
  final String nowPlayingMessage;

   MoviesFailerState({required this.nowPlayingMessage});
}*/
