class TopRatedMoviesResponseEntity {
  int page;
  List<ResultsTopRatedMovies> results;
  int totalPages;
  int totalResults;

  TopRatedMoviesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsTopRatedMovies {
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

  ResultsTopRatedMovies({
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
