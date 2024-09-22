// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_government_renewal_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAGovernmentRenewalViewModel _$FAGovernmentRenewalViewModelFromJson(
        Map<String, dynamic> json) =>
    FAGovernmentRenewalViewModel(
      json['renewalDate'] == null
          ? null
          : DateTime.parse(json['renewalDate'] as String),
      json['renewalDateNp'] as String,
      (json['renewalCost'] as num).toDouble(),
      (json['renewalFine'] as num).toDouble(),
      (json['renewalTotalAmount'] as num).toDouble(),
      json['renewalEffectiveFromDate'] == null
          ? null
          : DateTime.parse(json['renewalEffectiveFromDate'] as String),
      json['renewalEffectiveFromDateNp'] as String,
      json['renewalEffectiveToDate'] == null
          ? null
          : DateTime.parse(json['renewalEffectiveToDate'] as String),
      json['renewalEffectiveToDateNp'] as String,
      json['fACardId'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$FAGovernmentRenewalViewModelToJson(
        FAGovernmentRenewalViewModel instance) =>
    <String, dynamic>{
      'renewalDate': instance.renewalDate?.toIso8601String(),
      'renewalDateNp': instance.renewalDateNp,
      'renewalCost': instance.renewalCost,
      'renewalFine': instance.renewalFine,
      'renewalTotalAmount': instance.renewalTotalAmount,
      'renewalEffectiveFromDate':
          instance.renewalEffectiveFromDate?.toIso8601String(),
      'renewalEffectiveFromDateNp': instance.renewalEffectiveFromDateNp,
      'renewalEffectiveToDate':
          instance.renewalEffectiveToDate?.toIso8601String(),
      'renewalEffectiveToDateNp': instance.renewalEffectiveToDateNp,
      'fACardId': instance.fACardId,
      'id': instance.id,
    };
