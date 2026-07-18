import 'package:egy_film/features/search/domain/entities/tv_series_search_response_entity.dart';

class TvSeriesSearchResponseDto {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TvSeriesSearchResponseDto({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  TvSeriesSearchResponseDto.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  TvSeriesSearchResponseEntity toEntity() {
    return TvSeriesSearchResponseEntity(
      page: page ?? 0,
      results: results?.map((result) => result.toEntity()).toList() ?? [],
      totalPages: totalPages ?? 0,
      totalResults: totalResults ?? 0,
    );
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  String? firstAirDate;
  String? name;
  double? voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    firstAirDate = json['first_air_date'];
    name = json['name'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  ResultsTvSeriesSearchEntity toEntity() {
    return ResultsTvSeriesSearchEntity(
      adult: adult ?? false,
      backdropPath: backdropPath ?? '',
      genreIds: genreIds ?? [],
      id: id ?? 0,
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      firstAirDate: firstAirDate ?? '',
      name: name ?? '',
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}