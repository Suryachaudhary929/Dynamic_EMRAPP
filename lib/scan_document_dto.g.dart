// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanDocumentDto _$ScanDocumentDtoFromJson(Map<String, dynamic> json) =>
    ScanDocumentDto(
      json['uploadFile'] as String?,
      json['sortIndex'] as int?,
      json['patientRegistrationId'] as int?,
    );

Map<String, dynamic> _$ScanDocumentDtoToJson(ScanDocumentDto instance) =>
    <String, dynamic>{
      'uploadFile': instance.uploadFile,
      'sortIndex': instance.sortIndex,
      'patientRegistrationId': instance.patientRegistrationId,
    };
