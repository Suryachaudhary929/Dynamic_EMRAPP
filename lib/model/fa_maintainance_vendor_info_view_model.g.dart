// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_maintainance_vendor_info_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAMaintainanceVendorInfoViewModel _$FAMaintainanceVendorInfoViewModelFromJson(
        Map<String, dynamic> json) =>
    FAMaintainanceVendorInfoViewModel(
      json['id'] as int,
      json['title'] as String,
      json['address'] as String,
      json['contactPersonName'] as String,
      json['contactPersonNo'] as String,
    );

Map<String, dynamic> _$FAMaintainanceVendorInfoViewModelToJson(
        FAMaintainanceVendorInfoViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'contactPersonName': instance.contactPersonName,
      'contactPersonNo': instance.contactPersonNo,
    };
