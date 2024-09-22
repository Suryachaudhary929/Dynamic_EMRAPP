// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_insurance_vendor_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAInsuranceVendorViewModel _$FAInsuranceVendorViewModelFromJson(
        Map<String, dynamic> json) =>
    FAInsuranceVendorViewModel(
      json['id'] as int,
      json['title'] as String,
      json['address'] as String,
      json['contactPersonName'] as String,
      json['contactPersonNo'] as String,
    );

Map<String, dynamic> _$FAInsuranceVendorViewModelToJson(
        FAInsuranceVendorViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'contactPersonName': instance.contactPersonName,
      'contactPersonNo': instance.contactPersonNo,
    };
