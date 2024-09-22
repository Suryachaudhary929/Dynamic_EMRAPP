// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_card_insurance_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FACardInsuranceViewModel _$FACardInsuranceViewModelFromJson(
        Map<String, dynamic> json) =>
    FACardInsuranceViewModel(
      json['insuranceVendorId'] as int?,
      (json['insuranceCost'] as num).toDouble(),
      (json['insuranceFine'] as num).toDouble(),
      (json['insuranceTotalAmount'] as num).toDouble(),
      json['isInsured'] as bool,
      json['agentName'] as String,
      json['contactNo'] as String,
      json['insuranceNo'] as String,
      json['insuranceIssueDate'] == null
          ? null
          : DateTime.parse(json['insuranceIssueDate'] as String),
      json['insuranceIssueDateNp'] as String,
      json['insuranceExpireDate'] == null
          ? null
          : DateTime.parse(json['insuranceExpireDate'] as String),
      json['insuranceExpireDateNp'] as String,
      json['insuranceVendor'] as String,
      json['fACardId'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$FACardInsuranceViewModelToJson(
        FACardInsuranceViewModel instance) =>
    <String, dynamic>{
      'insuranceVendorId': instance.insuranceVendorId,
      'insuranceCost': instance.insuranceCost,
      'insuranceFine': instance.insuranceFine,
      'insuranceTotalAmount': instance.insuranceTotalAmount,
      'isInsured': instance.isInsured,
      'agentName': instance.agentName,
      'contactNo': instance.contactNo,
      'insuranceNo': instance.insuranceNo,
      'insuranceIssueDate': instance.insuranceIssueDate?.toIso8601String(),
      'insuranceIssueDateNp': instance.insuranceIssueDateNp,
      'insuranceExpireDate': instance.insuranceExpireDate?.toIso8601String(),
      'insuranceExpireDateNp': instance.insuranceExpireDateNp,
      'insuranceVendor': instance.insuranceVendor,
      'fACardId': instance.fACardId,
      'id': instance.id,
    };
