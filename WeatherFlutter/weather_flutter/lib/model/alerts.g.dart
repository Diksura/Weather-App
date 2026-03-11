// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alerts _$AlertsFromJson(Map<String, dynamic> json) => Alerts(
  alert: (json['alert'] as List<dynamic>)
      .map((e) => Alert.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AlertsToJson(Alerts instance) => <String, dynamic>{
  'alert': instance.alert,
};

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
  headline: json['headline'] as String,
  msgType: json['msgtype'] as String,
  severity: json['severity'] as String,
  urgency: json['urgency'] as String,
  areas: json['areas'] as String,
  category: json['category'] as String,
  certainty: json['certainty'] as String,
  event: json['event'] as String,
  note: json['note'] as String,
  effective: json['effective'] as String,
  expires: json['expires'] as String,
  description: json['desc'] as String,
  instruction: json['instruction'] as String,
  isCritical:
      $enumDecodeNullable(_$AlertSeverityEnumMap, json['isCritical']) ??
      AlertSeverity.low,
);

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
  'headline': instance.headline,
  'msgtype': instance.msgType,
  'severity': instance.severity,
  'urgency': instance.urgency,
  'areas': instance.areas,
  'category': instance.category,
  'certainty': instance.certainty,
  'event': instance.event,
  'note': instance.note,
  'effective': instance.effective,
  'expires': instance.expires,
  'desc': instance.description,
  'instruction': instance.instruction,
  'isCritical': _$AlertSeverityEnumMap[instance.isCritical]!,
};

const _$AlertSeverityEnumMap = {
  AlertSeverity.low: 'Low',
  AlertSeverity.moderate: 'Moderate',
  AlertSeverity.extreme: 'Extreme',
};
