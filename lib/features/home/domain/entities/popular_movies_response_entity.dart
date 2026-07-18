class PopularMoviesResponseEntity {
  int page;
  List<ResultsPopularMovies> results;
  int totalPages;
  int totalResults;

  PopularMoviesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsPopularMovies {
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

  ResultsPopularMovies({
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
