import 'package:json_annotation/json_annotation.dart';

part 'json_serialising/alerts.g.dart';

@JsonSerializable()
class Alerts {
  final List<Alert> alert;

  Alerts({required this.alert});

  factory Alerts.fromJson(Map<String, dynamic> json) => _$AlertsFromJson(json);
}

@JsonSerializable()
class Alert {
  final String headline;

  @JsonKey(name: 'msgtype')
  final String msgType;
  final String severity;
  final String urgency;
  final String areas;
  final String category;
  final String certainty;
  final String event;
  final String note;
  final String effective;
  final String expires;

  @JsonKey(name: 'desc')
  final String description;

  final String instruction;

  @JsonKey(defaultValue: AlertSeverity.low)
  final AlertSeverity isCritical;

  Alert({
    required this.headline,
    required this.msgType,
    required this.severity,
    required this.urgency,
    required this.areas,
    required this.category,
    required this.certainty,
    required this.event,
    required this.note,
    required this.effective,
    required this.expires,
    required this.description,
    required this.instruction,
    this.isCritical = AlertSeverity.low,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);
}

@JsonEnum()
enum AlertSeverity {
  @JsonValue("Low")
  low,
  @JsonValue("Moderate")
  moderate,
  @JsonValue("Extreme")
  extreme,
}
