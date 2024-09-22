// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_maintainance_info_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAMaintainanceInfoViewModel _$FAMaintainanceInfoViewModelFromJson(
        Map<String, dynamic> json) =>
    FAMaintainanceInfoViewModel(
      json['vendorId'] as int,
      json['vendor'] as String,
      (json['charge'] as num).toDouble(),
      json['maintainanceFromDate'] == null
          ? null
          : DateTime.parse(json['maintainanceFromDate'] as String),
      json['maintainanceFromDateNp'] as String,
      json['maintainanceToDate'] == null
          ? null
          : DateTime.parse(json['maintainanceToDate'] as String),
      json['maintainanceToDateNp'] as String,
      json['nextServiceDate'] == null
          ? null
          : DateTime.parse(json['nextServiceDate'] as String),
      json['nextServiceDateNp'] as String,
      json['warrantyFromDate'] == null
          ? null
          : DateTime.parse(json['warrantyFromDate'] as String),
      json['warrantyFromDateNp'] as String,
      json['warrantyToDate'] == null
          ? null
          : DateTime.parse(json['warrantyToDate'] as String),
      json['warrantyToDateNp'] as String,
      json['fACardId'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$FAMaintainanceInfoViewModelToJson(
        FAMaintainanceInfoViewModel instance) =>
    <String, dynamic>{
      'vendorId': instance.vendorId,
      'vendor': instance.vendor,
      'charge': instance.charge,
      'maintainanceFromDate': instance.maintainanceFromDate?.toIso8601String(),
      'maintainanceFromDateNp': instance.maintainanceFromDateNp,
      'maintainanceToDate': instance.maintainanceToDate?.toIso8601String(),
      'maintainanceToDateNp': instance.maintainanceToDateNp,
      'nextServiceDate': instance.nextServiceDate?.toIso8601String(),
      'nextServiceDateNp': instance.nextServiceDateNp,
      'warrantyFromDate': instance.warrantyFromDate?.toIso8601String(),
      'warrantyFromDateNp': instance.warrantyFromDateNp,
      'warrantyToDate': instance.warrantyToDate?.toIso8601String(),
      'warrantyToDateNp': instance.warrantyToDateNp,
      'fACardId': instance.fACardId,
      'id': instance.id,
    };
