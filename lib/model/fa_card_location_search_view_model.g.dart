// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_card_location_search_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FACardLocationSearchViewModel _$FACardLocationSearchViewModelFromJson(
        Map<String, dynamic> json) =>
    FACardLocationSearchViewModel(
      json['id'] as int,
      json['cardNumber'] as String,
      json['cardNumberSequence'] as int,
      json['description'] as String,
      json['serialNumber'] as String,
      json['responsibleEmployee'] as String,
      json['currentLocation'] as String,
      json['isActive'] as bool,
      json['isBlocked'] as bool,
      json['previousFACode'] as String,
      json['fAClass'] as String,
      json['fASubClass'] as String,
      json['isUnderMaintenance'] as bool,
      json['model'] as String,
      json['productId'] as int,
      json['isDisposed'] as bool,
      json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
    );

Map<String, dynamic> _$FACardLocationSearchViewModelToJson(
        FACardLocationSearchViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardNumber': instance.cardNumber,
      'cardNumberSequence': instance.cardNumberSequence,
      'description': instance.description,
      'serialNumber': instance.serialNumber,
      'responsibleEmployee': instance.responsibleEmployee,
      'currentLocation': instance.currentLocation,
      'isActive': instance.isActive,
      'isBlocked': instance.isBlocked,
      'previousFACode': instance.previousFACode,
      'fAClass': instance.fAClass,
      'fASubClass': instance.fASubClass,
      'isUnderMaintenance': instance.isUnderMaintenance,
      'model': instance.model,
      'productId': instance.productId,
      'isDisposed': instance.isDisposed,
      'fromDate': instance.fromDate?.toIso8601String(),
    };
