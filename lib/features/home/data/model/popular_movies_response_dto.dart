import 'package:egy_film/features/home/domain/entities/popular_movies_response_entity.dart';

class PopularMoviesResponseDto {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularMoviesResponseDto(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularMoviesResponseDto.fromJson(Map<String, dynamic> json) {
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

  PopularMoviesResponseEntity toEntity() {
    return PopularMoviesResponseEntity(
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
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Results(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  ResultsPopularMovies toEntity() {
    return ResultsPopularMovies(
      adult: adult ?? false,
      backdropPath: backdropPath ?? '',
      genreIds: genreIds ?? [],
      id: id ?? 0,
      overview: overview ?? '',
      posterPath: posterPath ?? '',
      releaseDate: releaseDate ?? '',
      title: title ?? '',
      video: video ?? false,
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}