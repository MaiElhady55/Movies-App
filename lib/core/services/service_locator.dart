import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void init() {
    //Bloc
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt()));
    //Use Case
    getIt.registerLazySingleton(() => GetNowPlayingMovies(getIt()));
    getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMovies(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetails(getIt()));

    //Repository
    getIt.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(getIt()));

    //Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSourc>(
        () => MovieRemoteDataSourc());
  }
}
