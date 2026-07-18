import 'package:egy_film/features/home/domain/entities/movie_trailers_response_entity.dart';

class MovieTrailersResponseDto {
  int? id;
  List<Results>? results;

  MovieTrailersResponseDto({this.id, this.results});

  MovieTrailersResponseDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  MovieTrailersResponseEntity toEntity() {
    return MovieTrailersResponseEntity(
      id: id ?? 0,
      results: results?.map((result) => result.toEntity()).toList() ?? [],
    );
  }
}

class Results {
  String? iso6391;
  String? iso31661;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  String? id;

  Results({
    this.iso6391,
    this.iso31661,
    this.name,
    this.key,
    this.site,
    this.size,
    this.type,
    this.official,
    this.publishedAt,
    this.id,
  });

  Results.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  ResultsMovieTrailers toEntity() {
    return ResultsMovieTrailers(
      name: name ?? '',
      key: key ?? '',
      site: site ?? '',
      size: size ?? 0,
      type: type ?? '',
      official: official ?? false,
      id: id ?? '',
    );
  }
}