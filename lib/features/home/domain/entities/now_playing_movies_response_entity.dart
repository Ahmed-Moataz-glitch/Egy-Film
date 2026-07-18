class NowPlayingMoviesResponseEntity {
  int page;
  List<ResultsNowPlayingMovies> results;
  int totalPages;
  int totalResults;

  NowPlayingMoviesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsNowPlayingMovies {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ResultsNowPlayingMovies({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.id = 0,
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}
