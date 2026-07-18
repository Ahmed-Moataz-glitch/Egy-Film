class PopularTvSeriesResponseEntity {
  int page;
  List<ResultsPopularTvSeries> results;
  int totalPages;
  int totalResults;

  PopularTvSeriesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsPopularTvSeries {
  String backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  String overview;
  String posterPath;
  double voteAverage;
  int voteCount;

  ResultsPopularTvSeries({
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
