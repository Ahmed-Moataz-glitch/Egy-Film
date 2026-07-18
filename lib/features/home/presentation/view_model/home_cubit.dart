import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/domain/entities/airing_today_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/movie_details_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/movie_trailers_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/now_playing_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/popular_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/popular_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/similar_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/similar_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/top_rated_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/top_rated_tv_series_response_dto.dart';
import 'package:egy_film/features/home/domain/entities/tv_series_details_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/tv_series_trailers_response_entity.dart';import 'package:egy_film/features/home/domain/use_case/get_airing_today_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_movie_details_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_movie_trailers_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_popular_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_popular_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_similar_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_similar_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_top_rated_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_tv_series_details_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_tv_series_trailers_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/is_movie_saved_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/is_tv_series_saved_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/save_movie_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/save_tv_series_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTopRatedMoviesUseCase  getTopRatedMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final IsMovieSavedUseCase isMovieSavedUseCase;
  final SaveMovieUseCase saveMovieUseCase;
  final IsTvSeriesSavedUseCase isTvSeriesSavedUseCase;
  final SaveTvSeriesUseCase saveTvSeriesUseCase;
  final GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  final GetMovieTrailersUseCase getMovieTrailersUseCase;
  final GetTopRatedTvSeriesUseCase getTopRatedTvSeriesUseCase;
  final GetPopularTvSeriesUseCase getPopularTvSeriesUseCase;
  final GetAiringTodayTvSeriesUseCase getAiringTodayTvSeriesUseCase;
  final GetTvSeriesDetailsUseCase getTvSeriesDetailsUseCase;
  final GetSimilarTvSeriesUseCase getSimilarTvSeriesUseCase;
  final GetTvSeriesTrailersUseCase getTvSeriesTrailersUseCase;
  HomeCubit({
    required this.getTopRatedMoviesUseCase,
    required this.getPopularMoviesUseCase,
    required this.getNowPlayingMoviesUseCase,
    required this.getMovieDetailsUseCase,
    required this.isMovieSavedUseCase,
    required this.saveMovieUseCase,
    required this.isTvSeriesSavedUseCase,
    required this.saveTvSeriesUseCase,
    required this.getSimilarMoviesUseCase,
    required this.getMovieTrailersUseCase,
    required this.getTopRatedTvSeriesUseCase,
    required this.getPopularTvSeriesUseCase,
    required this.getAiringTodayTvSeriesUseCase,
    required this.getTvSeriesDetailsUseCase,
    required this.getSimilarTvSeriesUseCase,
    required this.getTvSeriesTrailersUseCase,
  }) : super(HomeInitial());

  Future<void> getTopRatedMovies(bool isArabic) async {
    emit(TopRatedMoviesLoading());
    try {
      final result = await getTopRatedMoviesUseCase.call(isArabic);
      switch (result) {
        case ApiSuccess<TopRatedMoviesResponseEntity>():
          emit(
            TopRatedMoviesSuccess(result.data!),
          );
        case ApiError<TopRatedMoviesResponseEntity>():
          emit(TopRatedMoviesError(result.message));
      }
    } catch (e) {
      emit(TopRatedMoviesError(e.toString()));
    }
  }

  Future<void> getPopularMovies(bool isArabic) async {
    emit(PopularMoviesLoading());
    try {
      final result = await getPopularMoviesUseCase.call(isArabic);
      switch (result) {
        case ApiSuccess<PopularMoviesResponseEntity>():
          emit(PopularMoviesSuccess(result.data!));
        case ApiError<PopularMoviesResponseEntity>():
          emit(PopularMoviesError(result.message));
      }
    } catch (e) {
      emit(PopularMoviesError(e.toString()));
    }
  }

  Future<void> getNowPlayingMovies(bool isArabic) async {
    emit(NowPlayingMoviesLoading());
    try {
      final result = await getNowPlayingMoviesUseCase.call(isArabic);
      switch (result) {
        case ApiSuccess<NowPlayingMoviesResponseEntity>():
          emit(
            NowPlayingMoviesSuccess(result.data!),
          );
        case ApiError<NowPlayingMoviesResponseEntity>():
          emit(NowPlayingMoviesError(result.message));
      }
    } catch (e) {
      emit(NowPlayingMoviesError(e.toString()));
    }
  }

  Future<void> getMovieDetails({required int movieId, required bool isArabic}) async {
    emit(MovieDetailsLoading());
    try {
      final result = await getMovieDetailsUseCase.call(movieId: movieId, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<MovieDetailsResponseEntity>():
          emit(MovieDetailsSuccess(result.data!));
        case ApiError<MovieDetailsResponseEntity>():
          emit(MovieDetailsError(result.message));
      }
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }

  bool isMovieSaved(int movieId) {
    return isMovieSavedUseCase.call(movieId);
  }

  Future<void> saveMovie(MovieModel movie) async {
    await saveMovieUseCase.call(movie);
  }

  bool isTvSeriesSaved(int tvSeriesId) {
    return isTvSeriesSavedUseCase.call(tvSeriesId);
  }

  Future<void> saveTvSeries(TvSeriesModel tvSeries) async {
    await saveTvSeriesUseCase.call(tvSeries);
  }

  Future<void> getSimilarMovies({required int movieId, required bool isArabic}) async {
    emit(SimilarMoviesLoading());
    try {
      final result = await getSimilarMoviesUseCase.call(movieId: movieId, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<SimilarMoviesResponseEntity>():
          emit(
            SimilarMoviesSuccess(result.data!),
          );
        case ApiError<SimilarMoviesResponseEntity>():
          emit(SimilarMoviesError(result.message));
      }
    } catch (e) {
      emit(SimilarMoviesError(e.toString()));
    }
  }

  Future<void> getMovieTrailers({required int movieId, required bool isArabic}) async {
    emit(MovieTrailersLoading());
    try {
      final result = await getMovieTrailersUseCase.call(movieId: movieId, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<MovieTrailersResponseEntity>():
          emit(
            MovieTrailersSuccess(result.data!),
          );
        case ApiError<MovieTrailersResponseEntity>():
          emit(MovieTrailersError(result.message));
      }
    } catch (e) {
      emit(MovieTrailersError(e.toString()));
    }
  }

  Future<void> getTopRatedTvSeries(bool isArabic) async {
    emit(TopRatedTvSeriesLoading());
    try {
      final result = await getTopRatedTvSeriesUseCase.call(isArabic);
      switch (result) {
        case ApiSuccess<TopRatedTvSeriesResponseEntity>():
          emit(
            TopRatedTvSeriesSuccess(result.data!),
          );
        case ApiError<TopRatedTvSeriesResponseEntity>():
          emit(TopRatedTvSeriesError(result.message));
      }
    } catch (e) {
      emit(TopRatedTvSeriesError(e.toString()));
    }
  }

  Future<void> getPopularTvSeries(bool isArabic) async {
    emit(PopularTvSeriesLoading());
    try {
      final result = await getPopularTvSeriesUseCase.call(isArabic);
      switch (result) {
        case ApiSuccess<PopularTvSeriesResponseEntity>():
          emit(
            PopularTvSeriesSuccess(result.data!),
          );
        case ApiError<PopularTvSeriesResponseEntity>():
          emit(PopularTvSeriesError(result.message));
      }
    } catch (e) {
      emit(PopularTvSeriesError(e.toString()));
    }
  }

  Future<void> getAiringTodayTvSeries(bool isArabic) async {
    emit(AiringTodayTvSeriesLoading());
    try {
      final result = await getAiringTodayTvSeriesUseCase.call(isArabic);
      switch (result) {
        case ApiSuccess<AiringTodayTvSeriesResponseEntity>():
          emit(
            AiringTodayTvSeriesSuccess(result.data!),
          );
        case ApiError<AiringTodayTvSeriesResponseEntity>():
          emit(AiringTodayTvSeriesError(result.message));
      }
    } catch (e) {
      emit(AiringTodayTvSeriesError(e.toString()));
    }
  }

  Future<void> getTvSeriesDetails({required int tvSeriesId, required bool isArabic}) async {
    emit(TvSeriesDetailsLoading());
    try {
      final result = await getTvSeriesDetailsUseCase.call(tvSeriesId: tvSeriesId, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<TvSeriesDetailsResponseEntity>():
          emit(
            TvSeriesDetailsSuccess(result.data!),
          );
        case ApiError<TvSeriesDetailsResponseEntity>():
          emit(TvSeriesDetailsError(result.message));
      }
    } catch (e) {
      emit(TvSeriesDetailsError(e.toString()));
    }
  }

  Future<void> getSimilarTvSeries({required int tvSeriesId, required bool isArabic}) async {
    emit(SimilarTvSeriesLoading());
    try {
      final result = await getSimilarTvSeriesUseCase.call(tvSeriesId: tvSeriesId, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<SimilarTvSeriesResponseEntity>():
          emit(
            SimilarTvSeriesSuccess(result.data!),
          );
        case ApiError<SimilarTvSeriesResponseEntity>():
          emit(SimilarTvSeriesError(result.message));
      }
    } catch (e) {
      emit(SimilarTvSeriesError(e.toString()));
    }
  }

  Future<void> getTvSeriesTrailers({required int tvSeriesId, required bool isArabic}) async {
    emit(TvSeriesTrailersLoading());
    try {
      final result = await getTvSeriesTrailersUseCase.call(tvSeriesId: tvSeriesId, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<TvSeriesTrailersResponseEntity>():
          emit(
            TvSeriesTrailersSuccess(result.data!),
          );
        case ApiError<TvSeriesTrailersResponseEntity>():
          emit(TvSeriesTrailersError(result.message));
      }
    } catch (e) {
      emit(TvSeriesTrailersError(e.toString()));
    }
  }
}
