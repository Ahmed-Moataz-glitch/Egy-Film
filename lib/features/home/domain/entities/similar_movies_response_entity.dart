class SimilarMoviesResponseEntity {
  int page;
  List<ResultsSimilarMovies> results;
  int totalPages;
  int totalResults;

  SimilarMoviesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsSimilarMovies {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ResultsSimilarMovies({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.id = 0,
    this.overview = '',
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}
