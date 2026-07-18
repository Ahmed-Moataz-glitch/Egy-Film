// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_series_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TvSeriesModelAdapter extends TypeAdapter<TvSeriesModel> {
  @override
  final int typeId = 1;

  @override
  TvSeriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TvSeriesModel(
      id: fields[0] as int,
      posterPath: fields[1] as String,
      name: fields[2] as String,
      voteAverage: fields[3] as double,
      category: fields[4] as String,
      firstAirDate: fields[5] as String,
      duration: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TvSeriesModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.posterPath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.voteAverage)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.firstAirDate)
      ..writeByte(6)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TvSeriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
