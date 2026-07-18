class MovieTrailersResponseEntity {
  int id;
  List<ResultsMovieTrailers> results;

  MovieTrailersResponseEntity({this.id = 0, this.results = const []});
}

class ResultsMovieTrailers {
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String id;

  ResultsMovieTrailers({
    this.name = '',
    this.key = '',
    this.site = '',
    this.size = 0,
    this.type = '',
    this.official = false,
    this.id = '',
  });
}
