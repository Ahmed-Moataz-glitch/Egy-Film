class TopRatedTvSeriesResponseEntity {
  int page;
  List<ResultsTopRatedTvSeries> results;
  int totalPages;
  int totalResults;

  TopRatedTvSeriesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsTopRatedTvSeries {
  String backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  String overview;
  String posterPath;
  double voteAverage;
  int voteCount;

  ResultsTopRatedTvSeries({
    this.backdropPath = '',
    this.firstAirDate = '',
    this.genreIds = const [],
    this.id = 0,
    this.name = '',
    this.overview = '',
    this.posterPath = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}
