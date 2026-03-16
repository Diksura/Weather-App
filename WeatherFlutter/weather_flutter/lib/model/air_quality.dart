import 'package:json_annotation/json_annotation.dart';

part 'json_serialising/air_quality.g.dart';

@JsonSerializable()
class AirQuality {
  final double co;
  final double no2;
  final double o3;
  final double so2;

  @JsonKey(name: 'pm2_5')
  final double pm2_5;

  final double pm10;

  @JsonKey(name: 'us-epa-index')
  final double usEpaIndex;

  @JsonKey(name: 'gb-defra-index')
  final double gbDefraIndex;

  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) => _$AirQualityFromJson(json);
}
