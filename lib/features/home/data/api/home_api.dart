import 'dart:convert';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/core/utils/secure_storage.dart';
import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/data/model/airing_today_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/movie_details_reponse_dto.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/movie_trailers_response_dto.dart';
import 'package:egy_film/features/home/data/model/now_playing_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/popular_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/popular_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/similar_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/similar_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/top_rated_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/top_rated_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/tv_series_details_response_dto.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_trailers_response_dto.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class HomeApi {
  final token = SecureStorage.getToken();

  Future<ApiResult<TopRatedMoviesResponseDto>> getTopRatedMovies(
    bool isArabic,
  ) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.topRatedMoviesEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<TopRatedMoviesResponseDto>(
        TopRatedMoviesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<TopRatedMoviesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<PopularMoviesResponseDto>> getPopularMovies(
    bool isArabic,
  ) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.popularMoviesEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<PopularMoviesResponseDto>(
        PopularMoviesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<PopularMoviesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<NowPlayingMoviesResponseDto>> getNowPlayingMovies(
    bool isArabic,
  ) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.nowPlayingMoviesEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<NowPlayingMoviesResponseDto>(
        NowPlayingMoviesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<NowPlayingMoviesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<MovieDetailsResponseDto>> getMovieDetails({
    required int movieId,
    required bool isArabic,
  }) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      '${AppConstants.movieDetailsEndpoint}$movieId',
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<MovieDetailsResponseDto>(
        MovieDetailsResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<MovieDetailsResponseDto>(e.toString());
    }
  }

  bool isMovieSaved(int movieId) {
    final moviesBox = Hive.box<MovieModel>(AppConstants.moviesBox);
    return moviesBox.containsKey(movieId);
  }

  Future<bool> saveMovie(MovieModel movie) async {
    final moviesBox = Hive.box<MovieModel>(AppConstants.moviesBox);

    if (moviesBox.containsKey(movie.id)) {
      await moviesBox.delete(movie.id);
      return false;
    } else {
      await moviesBox.put(movie.id, movie);
      return true;
    }
  }

  bool isTvSeriesSaved(int tvSeriesId) {
    final tvSeriesBox = Hive.box<TvSeriesModel>(AppConstants.tvSeriesBox);
    return tvSeriesBox.containsKey(tvSeriesId);
  }

  Future<bool> saveTvSeries(TvSeriesModel tvSeries) async {
    final tvSeriesBox = Hive.box<TvSeriesModel>(AppConstants.tvSeriesBox);

    if (tvSeriesBox.containsKey(tvSeries.id)) {
      await tvSeriesBox.delete(tvSeries.id);
      return false;
    } else {
      await tvSeriesBox.put(tvSeries.id, tvSeries);
      return true;
    }
  }

  Future<ApiResult<SimilarMoviesResponseDto>> getSimilarMovies({
    required int movieId,
    required bool isArabic,
  }) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      '${AppConstants.movieDetailsEndpoint}$movieId${AppConstants.similarMoviesEndpoint}',
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<SimilarMoviesResponseDto>(
        SimilarMoviesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<SimilarMoviesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<MovieTrailersResponseDto>> getMovieTrailers({
    required int movieId,
    required bool isArabic,
  }) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      '${AppConstants.movieDetailsEndpoint}$movieId${AppConstants.movieTrailersEndpoint}',
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<MovieTrailersResponseDto>(
        MovieTrailersResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<MovieTrailersResponseDto>(e.toString());
    }
  }

  Future<ApiResult<TopRatedTvSeriesResponseDto>> getTopRatedTvSeries(
    bool isArabic,
  ) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.topRatedTvSeriesEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<TopRatedTvSeriesResponseDto>(
        TopRatedTvSeriesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<TopRatedTvSeriesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<PopularTvSeriesResponseDto>> getPopularTvSeries(
    bool isArabic,
  ) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.popularTvSeriesEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<PopularTvSeriesResponseDto>(
        PopularTvSeriesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<PopularTvSeriesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<AiringTodayTvSeriesResponseDto>> getAiringTodayTvSeries(
    bool isArabic,
  ) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.airingTodayTvSeriesEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<AiringTodayTvSeriesResponseDto>(
        AiringTodayTvSeriesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<AiringTodayTvSeriesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<TvSeriesDetailsResponseDto>> getTvSeriesDetails({
    required int tvSeriesId,
    required bool isArabic,
  }) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      '${AppConstants.tvSeriesDetailsEndpoint}$tvSeriesId',
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<TvSeriesDetailsResponseDto>(
        TvSeriesDetailsResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<TvSeriesDetailsResponseDto>(e.toString());
    }
  }

  Future<ApiResult<SimilarTvSeriesResponseDto>> getSimilarTvSeries({
    required int tvSeriesId,
    required bool isArabic,
  }) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      '${AppConstants.tvSeriesDetailsEndpoint}$tvSeriesId${AppConstants.similarTvSeriesEndpoint}',
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<SimilarTvSeriesResponseDto>(
        SimilarTvSeriesResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<SimilarTvSeriesResponseDto>(e.toString());
    }
  }

  Future<ApiResult<TvSeriesTrailersResponseDto>> getTvSeriesTrailers({
    required int tvSeriesId,
    required bool isArabic,
  }) async {
    var url = Uri.https(
      AppConstants.baseUrl,
      '${AppConstants.tvSeriesDetailsEndpoint}$tvSeriesId${AppConstants.tvSeriesTrailersEndpoint}',
      {
        'api_key': AppConstants.apiKey,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<TvSeriesTrailersResponseDto>(
        TvSeriesTrailersResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<TvSeriesTrailersResponseDto>(e.toString());
    }
  }
}
