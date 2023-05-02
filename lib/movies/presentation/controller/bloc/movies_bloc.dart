import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enum.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MoviesBloc(
      this.getNowPlayingMovies, this.getPopularMovies, this.getTopRatedMovies)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    //emit(MoviesLoadingState());
    final result = await getNowPlayingMovies(const NoParameters());
    //emit(const MoviesState(nowPlayingState: RequestState.loaded));
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));

    /*result.fold((l) => emit(MoviesFailerState(nowPlayingMessage: l.message)),
          (r) => emit(MoviesSucessState(nowPlayingMovies: r)));*/
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMovies(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(state.copyWith(
            popularState: RequestState.loaded, popularMovies: r)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMovies(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: r)));
  }
}
