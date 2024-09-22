// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_for_scanner_client_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientForScannerClientViewModel _$PatientForScannerClientViewModelFromJson(
        Map<String, dynamic> json) =>
    PatientForScannerClientViewModel(
      json['id'] as int,
      json['firstName'] as String,
      json['middleName'] as String?,
      json['lastName'] as String,
      json['fullName'] as String,
      json['visits'] as List<dynamic>,
    );

Map<String, dynamic> _$PatientForScannerClientViewModelToJson(
        PatientForScannerClientViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'fullName': instance.fullName,
      'visits': instance.visits,
    };
