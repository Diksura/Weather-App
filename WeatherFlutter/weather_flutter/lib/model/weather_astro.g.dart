// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_astro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherAstro _$WeatherAstroFromJson(Map<String, dynamic> json) => WeatherAstro(
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  astronomy: Astronomy.fromJson(json['astronomy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WeatherAstroToJson(WeatherAstro instance) =>
    <String, dynamic>{
      'location': instance.location,
      'astronomy': instance.astronomy,
    };

Astronomy _$AstronomyFromJson(Map<String, dynamic> json) =>
    Astronomy(astro: Astro.fromJson(json['astro'] as Map<String, dynamic>));

Map<String, dynamic> _$AstronomyToJson(Astronomy instance) => <String, dynamic>{
  'astro': instance.astro,
};
