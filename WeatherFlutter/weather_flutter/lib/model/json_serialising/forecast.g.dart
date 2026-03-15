// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
  date: json['date'] as String,
  dateEpoch: (json['date_epoch'] as num).toInt(),
  day: ForecastDay.fromJson(json['day'] as Map<String, dynamic>),
  astro: Astro.fromJson(json['astro'] as Map<String, dynamic>),
  hour: (json['hour'] as List<dynamic>)
      .map((e) => ForecastHour.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
  'date': instance.date,
  'date_epoch': instance.dateEpoch,
  'day': instance.day,
  'astro': instance.astro,
  'hour': instance.hour,
};
