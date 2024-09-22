// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_document_master_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanDocumentMasterDto _$ScanDocumentMasterDtoFromJson(
        Map<String, dynamic> json) =>
    ScanDocumentMasterDto(
      (json['uploadFiles'] as List<dynamic>?)
          ?.map((e) => ScanDocumentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['source'] as String?,
      json['pictureSource'] as String?,
      json['isScanCompleted'] as String?,
      json['pictureType'] as String?,
    );

Map<String, dynamic> _$ScanDocumentMasterDtoToJson(
        ScanDocumentMasterDto instance) =>
    <String, dynamic>{
      'uploadFiles': instance.uploadFiles,
      'source': instance.source,
      'pictureSource': instance.pictureSource,
      'isScanCompleted': instance.isScanCompleted,
      'pictureType': instance.pictureType,
    };
