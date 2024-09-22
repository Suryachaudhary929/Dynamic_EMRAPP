// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_visit_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientVisitViewModel _$PatientVisitViewModelFromJson(
        Map<String, dynamic> json) =>
    PatientVisitViewModel(
      json['registrationId'] as int,
      json['registrationTypeName'] as String,
      json['visitCount'] as int,
      DateTime.parse(json['registrationDate'] as String),
      json['department'] as String,
    );

Map<String, dynamic> _$PatientVisitViewModelToJson(
        PatientVisitViewModel instance) =>
    <String, dynamic>{
      'registrationId': instance.registrationId,
      'registrationTypeName': instance.registrationTypeName,
      'visitCount': instance.visitCount,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'department': instance.department,
    };
