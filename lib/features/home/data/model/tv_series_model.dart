import 'package:hive/hive.dart';

part 'tv_series_model.g.dart';

@HiveType(typeId: 1)
class TvSeriesModel extends HiveObject {
  @HiveField(0)
  final int id; 
  @HiveField(1)
  final String posterPath;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final double voteAverage;
  @HiveField(4)
  final String category;
  @HiveField(5)
  final String firstAirDate;
  @HiveField(6)
  final int duration;

  TvSeriesModel({
    required this.id,
    required this.posterPath,
    required this.name,
    required this.voteAverage,
    required this.category,
    required this.firstAirDate,
    required this.duration,
  });
}
