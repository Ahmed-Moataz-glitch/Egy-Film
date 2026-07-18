import 'package:egy_film/features/home/domain/entities/tv_series_details_response_entity.dart';

class TvSeriesDetailsResponseDto {
  bool? adult;
  String? backdropPath;
  List<CreatedBy>? createdBy;
  List<int>? episodeRunTime;
  String? firstAirDate;
  List<Genres>? genres;
  String? homepage;
  int? id;
  bool? inProduction;
  List<String>? languages;
  String? lastAirDate;
  String? name;
  Null nextEpisodeToAir;
  int? numberOfEpisodes;
  int? numberOfSeasons;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  List<Seasons>? seasons;
  String? status;
  String? tagline;
  String? type;
  double? voteAverage;
  int? voteCount;

  TvSeriesDetailsResponseDto({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.name,
    this.nextEpisodeToAir,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.seasons,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
  });

  TvSeriesDetailsResponseDto.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = <CreatedBy>[];
      json['created_by'].forEach((v) {
        createdBy!.add(CreatedBy.fromJson(v));
      });
    }
    episodeRunTime = json['episode_run_time'].cast<int>();
    firstAirDate = json['first_air_date'];
    homepage = json['homepage'];
    id = json['id'];
    inProduction = json['in_production'];
    languages = json['languages'].cast<String>();
    lastAirDate = json['last_air_date'];
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'];
    numberOfEpisodes = json['number_of_episodes'];
    numberOfSeasons = json['number_of_seasons'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['seasons'] != null) {
      seasons = <Seasons>[];
      json['seasons'].forEach((v) {
        seasons!.add(Seasons.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    type = json['type'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  TvSeriesDetailsResponseEntity toEntity() {
    return TvSeriesDetailsResponseEntity(
      adult: adult ?? false,
      backdropPath: backdropPath ?? '',
      createdBy: createdBy?.map((creator) => creator.toEntity()).toList() ?? [],
      episodeRunTime: episodeRunTime ?? [],
      firstAirDate: firstAirDate ?? '',
      id: id ?? 0,
      inProduction: inProduction ?? false,
      lastAirDate: lastAirDate ?? '',
      name: name ?? '',
      numberOfEpisodes: numberOfEpisodes ?? 0,
      numberOfSeasons: numberOfSeasons ?? 0,
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      seasons:
          seasons?.map((season) => season.toEntity()).toList() ??
          [], // Handle null case
      status: status ?? '',
      type: type ?? '',
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}

class CreatedBy {
  int? id;
  String? creditId;
  String? name;
  int? gender;
  String? profilePath;

  CreatedBy({this.id, this.creditId, this.name, this.gender, this.profilePath});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creditId = json['credit_id'];
    name = json['name'];
    gender = json['gender'];
    profilePath = json['profile_path'];
  }

  CreatedByEntity toEntity() {
    return CreatedByEntity(
      id: id ?? 0,
      creditId: creditId ?? '',
      name: name ?? '',
      gender: gender ?? 0,
      profilePath: profilePath ?? '',
    );
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  GenresTvSeriesDetailsEntity toEntity() {
    return GenresTvSeriesDetailsEntity(
      id: id ?? 0,
      name: name ?? '',
    );
  }
}

class Seasons {
  String? airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  String? posterPath;
  int? seasonNumber;
  double? voteAverage;

  Seasons({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'];
    id = json['id'];
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'];
    voteAverage = json['vote_average'];
  }

  SeasonsEntity toEntity() {
    return SeasonsEntity(
      airDate: airDate ?? '',
      episodeCount: episodeCount ?? 0,
      id: id ?? 0,
      name: name ?? '',
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      seasonNumber: seasonNumber ?? 0,
      voteAverage: voteAverage ?? 0.0,
    );
  }
}
