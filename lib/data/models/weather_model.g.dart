// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 1;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      temp: fields[0] as double,
      tempMax: fields[1] as double,
      tempMin: fields[2] as double,
      lat: fields[3] as double,
      long: fields[4] as double,
      feelsLike: fields[5] as double,
      pressure: fields[6] as int,
      description: fields[7] as String,
      currently: fields[8] as String,
      humidity: fields[9] as int,
      windSpeed: fields[10] as double,
      cityName: fields[11] as String,
      time: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.temp)
      ..writeByte(1)
      ..write(obj.tempMax)
      ..writeByte(2)
      ..write(obj.tempMin)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.long)
      ..writeByte(5)
      ..write(obj.feelsLike)
      ..writeByte(6)
      ..write(obj.pressure)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.currently)
      ..writeByte(9)
      ..write(obj.humidity)
      ..writeByte(10)
      ..write(obj.windSpeed)
      ..writeByte(11)
      ..write(obj.cityName)
      ..writeByte(12)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
