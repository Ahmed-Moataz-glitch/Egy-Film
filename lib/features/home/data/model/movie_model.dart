import 'package:hive/hive.dart';

part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String posterPath;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final double voteAverage;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String releaseDate;
  @HiveField(6)
  final int duration;

  MovieModel({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.category,
    required this.releaseDate,
    required this.duration,
  });
}
