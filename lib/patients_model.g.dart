// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientsModel _$PatientsModelFromJson(Map<String, dynamic> json) =>
    PatientsModel(
      json['id'] as int,
      json['firstName'] as String,
      json['middleName'] as String,
      json['lastName'] as String,
      json['fullName'] as String,
      (json['visits'] as List<dynamic>)
          .map((e) => PatientVisitViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientsModelToJson(PatientsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'visits': instance.visits,
    };
