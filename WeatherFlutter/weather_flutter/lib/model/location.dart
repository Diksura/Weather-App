import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localTimeEpoch;
  final String localTime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,

    @JsonKey(name: 'tz_id') required this.tzId,

    @JsonKey(name: 'localtime_epoch') required this.localTimeEpoch,

    @JsonKey(name: 'local_time') required this.localTime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
