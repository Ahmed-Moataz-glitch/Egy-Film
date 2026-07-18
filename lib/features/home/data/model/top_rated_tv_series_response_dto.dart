import 'package:egy_film/features/home/domain/entities/top_rated_tv_series_response_dto.dart';

class TopRatedTvSeriesResponseDto {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  TopRatedTvSeriesResponseDto({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  TopRatedTvSeriesResponseDto.fromJson(Map<String, dynamic> json) {
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

  TopRatedTvSeriesResponseEntity toEntity() {
    return TopRatedTvSeriesResponseEntity(
      page: page ?? 0,
      results: results?.map((result) => result.toEntity()).toList() ?? [],
      totalPages: totalPages ?? 0,
      totalResults: totalResults ?? 0,
    );
  }
}

class Results {
  String? backdropPath;
  String? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  Results({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  ResultsTopRatedTvSeries toEntity() {
    return ResultsTopRatedTvSeries(
      backdropPath: backdropPath ?? '',
      firstAirDate: firstAirDate ?? '',
      genreIds: genreIds ?? [],
      id: id ?? 0,
      name: name ?? '',
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}
