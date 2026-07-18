class TvSeriesDetailsResponseEntity {
  bool adult;
  String backdropPath;
  List<CreatedByEntity> createdBy;
  List<int> episodeRunTime;
  String firstAirDate;
  List<GenresTvSeriesDetailsEntity>? genres;
  int id;
  bool inProduction;
  String lastAirDate;
  String name;
  int numberOfEpisodes;
  int numberOfSeasons;
  String overview;
  String posterPath;
  List<SeasonsEntity> seasons;
  String status;
  String type;
  double voteAverage;
  int voteCount;

  TvSeriesDetailsResponseEntity({
    this.adult = false,
    this.backdropPath = '',
    this.createdBy = const [],
    this.episodeRunTime = const [],
    this.firstAirDate = '',
    this.id = 0,
    this.inProduction = false,
    this.lastAirDate = '',
    this.name = '',
    this.numberOfEpisodes = 0,
    this.numberOfSeasons = 0,
    this.overview = '',
    this.posterPath = '',
    this.seasons = const [],
    this.status = '',
    this.type = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });
}

class CreatedByEntity {
  int id;
  String creditId;
  String name;
  int gender;
  String profilePath;

  CreatedByEntity({
    this.id = 0,
    this.creditId = '',
    this.name = '',
    this.gender = 0,
    this.profilePath = '',
  });
}

class GenresTvSeriesDetailsEntity {
  int? id;
  String? name;

  GenresTvSeriesDetailsEntity({this.id, this.name});

  GenresTvSeriesDetailsEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class SeasonsEntity {
  String airDate;
  int episodeCount;
  int id;
  String name;
  String overview;
  String posterPath;
  int seasonNumber;
  double voteAverage;

  SeasonsEntity({
    this.airDate = '',
    this.episodeCount = 0,
    this.id = 0,
    this.name = '',
    this.overview = '',
    this.posterPath = '',
    this.seasonNumber = 0,
    this.voteAverage = 0.0,
  });
}

