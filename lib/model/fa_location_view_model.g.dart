// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_location_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FALocationViewModel _$FALocationViewModelFromJson(Map<String, dynamic> json) =>
    FALocationViewModel(
      json['id'] as int,
      json['locationCodeId'] as int,
      json['locationCode'] as String,
      json['faDepartmentId'] as int,
      json['faDepartment'] as String,
      json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      json['fromDateNp'] as String,
      json['toDate'] == null ? null : DateTime.parse(json['toDate'] as String),
      json['toDateNp'] as String,
      json['fACardId'] as int,
      json['days'] as int,
    );

Map<String, dynamic> _$FALocationViewModelToJson(
        FALocationViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locationCodeId': instance.locationCodeId,
      'locationCode': instance.locationCode,
      'faDepartmentId': instance.faDepartmentId,
      'faDepartment': instance.faDepartment,
      'fromDate': instance.fromDate?.toIso8601String(),
      'fromDateNp': instance.fromDateNp,
      'toDate': instance.toDate?.toIso8601String(),
      'toDateNp': instance.toDateNp,
      'fACardId': instance.fACardId,
      'days': instance.days,
    };
