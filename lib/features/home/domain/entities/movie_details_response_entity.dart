class MovieDetailsResponseEntity {
  bool adult;
  String backdropPath;
  int budget;
  List<GenresMovieDetails> genres;
  String homepage;
  int id;
  String imdbId;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int revenue;
  int runtime;
  String status;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailsResponseEntity(
      {this.adult = false,
      this.backdropPath = '',
      this.budget = 0,
      this.genres = const [],
      this.homepage = '',
      this.id = 0,
      this.imdbId = '',
      this.overview = '',
      this.popularity = 0.0,
      this.posterPath = '',
      this.releaseDate = '',
      this.revenue = 0,
      this.runtime = 0,
      this.status = '',
      this.title = '',
      this.video = false,
      this.voteAverage = 0.0,
      this.voteCount = 0});
}

class GenresMovieDetails {
  int id;
  String name;

  GenresMovieDetails({this.id = 0, this.name = ''});
}

