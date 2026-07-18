import 'package:firebase_auth/firebase_auth.dart';

abstract class AppConstants {
  static const String appName = 'Egy Film';
  static const String supabaseUrl = 'https://fpyhfzjvogguftbstimd.supabase.co';
  static const String anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZweWhmemp2b2dndWZ0YnN0aW1kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ5MDM3MjMsImV4cCI6MjA5MDQ3OTcyM30.w4yy1lzOtf8acgORhqFM9Xg3Iwl7DeqVjcqAB2iPzrI';
  static const String supabaseStorageBucket = 'Egy Film';
  static const String apiKey = '77d8ef1830e446022ee65ba11fd52bfa';
  // static const String accessToken =
  //     'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3N2Q4ZWYxODMwZTQ0NjAyMmVlNjViYTExZmQ1MmJmYSIsIm5iZiI6MTc2MzkzMjk1Ni4wNzIsInN1YiI6IjY5MjM3YjFjZjEwZmZkZDlkMjE4NzM3MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YZSgQJHBjM8VD8WiEfpZUQL8St0NuRnGjnRbWmV9_zM';
  static const String baseUrl = 'api.themoviedb.org';
  static const String topRatedMoviesEndpoint = '/3/movie/top_rated';
  static const String popularMoviesEndpoint = '/3/movie/popular';
  static const String nowPlayingMoviesEndpoint = '/3/movie/now_playing';
  static const String movieDetailsEndpoint = '/3/movie/';
  static const String similarMoviesEndpoint = '/similar';
  static const String imageUrlPrefix = 'https://image.tmdb.org/t/p/w500';
  static const String movieTrailersEndpoint = '/videos';
  static const String topRatedTvSeriesEndpoint = '/3/tv/top_rated';
  static const String popularTvSeriesEndpoint = '/3/tv/popular';
  static const String airingTodayTvSeriesEndpoint = '/3/tv/airing_today';
  static const String tvSeriesDetailsEndpoint = '/3/tv/';
  static const String similarTvSeriesEndpoint = '/similar';
  static const String tvSeriesTrailersEndpoint = '/videos';
  static const String videoUrlPrefix = 'https://www.youtube.com/watch?v=';
  static const String moviesSearchEndpoint = '/3/search/movie';
  static const String tvSeriesSearchEndpoint = '/3/search/tv';
  static String moviesBox = '${FirebaseAuth.instance.currentUser?.uid ?? 'default'}-movies-box';
  static String tvSeriesBox = '${FirebaseAuth.instance.currentUser?.uid ?? 'default'}-tv-series-box';
  static const String userProfileBox = 'user-profile-box';
}
