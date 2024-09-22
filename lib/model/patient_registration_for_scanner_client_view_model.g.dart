// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_registration_for_scanner_client_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientRegistrationForScannerClientViewModel
    _$PatientRegistrationForScannerClientViewModelFromJson(
            Map<String, dynamic> json) =>
        PatientRegistrationForScannerClientViewModel(
          json['registrationId'] as int,
          json['visitCount'] as int,
          DateTime.parse(json['registrationDate'] as String),
          json['registrationTypeName'] as String,
          json['department'] as String,
        );

Map<String, dynamic> _$PatientRegistrationForScannerClientViewModelToJson(
        PatientRegistrationForScannerClientViewModel instance) =>
    <String, dynamic>{
      'registrationId': instance.registrationId,
      'visitCount': instance.visitCount,
      'registrationDate': instance.registrationDate.toIso8601String(),
      'registrationTypeName': instance.registrationTypeName,
      'department': instance.department,
    };
