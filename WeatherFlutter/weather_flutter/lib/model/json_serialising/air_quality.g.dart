// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => AirQuality(
  co: (json['co'] as num).toDouble(),
  no2: (json['no2'] as num).toDouble(),
  o3: (json['o3'] as num).toDouble(),
  so2: (json['so2'] as num).toDouble(),
  pm2_5: (json['pm2_5'] as num).toDouble(),
  pm10: (json['pm10'] as num).toDouble(),
  usEpaIndex: (json['us-epa-index'] as num).toDouble(),
  gbDefraIndex: (json['gb-defra-index'] as num).toDouble(),
);

Map<String, dynamic> _$AirQualityToJson(AirQuality instance) =>
    <String, dynamic>{
      'co': instance.co,
      'no2': instance.no2,
      'o3': instance.o3,
      'so2': instance.so2,
      'pm2_5': instance.pm2_5,
      'pm10': instance.pm10,
      'us-epa-index': instance.usEpaIndex,
      'gb-defra-index': instance.gbDefraIndex,
    };
