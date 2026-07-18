class TvSeriesTrailersResponseEntity {
  int id;
  List<ResultsTvSeriesTrailers> results;

  TvSeriesTrailersResponseEntity({this.id = 0, this.results = const []});
}

class ResultsTvSeriesTrailers {
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String id;

  ResultsTvSeriesTrailers({
    this.name = '',
    this.key = '',
    this.site = '',
    this.size = 0,
    this.type = '',
    this.official = false,
    this.id = '',
  });
}
