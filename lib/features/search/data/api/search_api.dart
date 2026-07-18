import 'dart:convert';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/core/utils/secure_storage.dart';
import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/data/model/movies_search_response_dto.dart';
import 'package:egy_film/features/search/data/model/tv_series_search_response_dto.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  final token = SecureStorage.getToken();

  Future<ApiResult<MoviesSearchResponseDto>> getMoviesSearch({
    required String searchText,
    required bool isArabic,
  }) async {
    final url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.moviesSearchEndpoint,
      {
        'api_key': AppConstants.apiKey, 
        'query': searchText,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<MoviesSearchResponseDto>(
        MoviesSearchResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<MoviesSearchResponseDto>(e.toString());
    }
  }

  Future<ApiResult<TvSeriesSearchResponseDto>> getTvSeriesSearch({
    required String searchText,
    required bool isArabic,
  }) async {
    final url = Uri.https(
      AppConstants.baseUrl,
      AppConstants.tvSeriesSearchEndpoint,
      {
        'api_key': AppConstants.apiKey,
        'query': searchText,
        'language': isArabic ? 'ar-EG' : 'en-US',
      },
    );
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return ApiSuccess<TvSeriesSearchResponseDto>(
        TvSeriesSearchResponseDto.fromJson(json),
      );
    } catch (e) {
      return ApiError<TvSeriesSearchResponseDto>(e.toString());
    }
  }
}
