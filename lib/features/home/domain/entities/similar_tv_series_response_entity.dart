class SimilarTvSeriesResponseEntity {
  int page;
  List<ResultsSimilarTvSeries> results;
  int totalPages;
  int totalResults;

  SimilarTvSeriesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsSimilarTvSeries {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String overview;
  String posterPath;
  String firstAirDate;
  String name;
  double voteAverage;
  int voteCount;

  ResultsSimilarTvSeries({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.id = 0,
    this.overview = '',
    this.posterPath = '',
    this.firstAirDate = '',
    this.name = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}
