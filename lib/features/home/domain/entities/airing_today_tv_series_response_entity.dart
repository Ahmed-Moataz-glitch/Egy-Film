class AiringTodayTvSeriesResponseEntity {
  int page;
  List<ResultsAiringTodayTvSeries> results;
  int totalPages;
  int totalResults;

  AiringTodayTvSeriesResponseEntity({
    this.page = 0,
    this.results = const [],
    this.totalPages = 0,
    this.totalResults = 0,
  });
}

class ResultsAiringTodayTvSeries {
  String backdropPath;
  String firstAirDate;
  List<int> genreIds;
  int id;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  double voteAverage;
  int voteCount;

  ResultsAiringTodayTvSeries({
    this.backdropPath = '',
    this.firstAirDate = '',
    this.genreIds = const [],
    this.id = 0, 
    this.name = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalName = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}
