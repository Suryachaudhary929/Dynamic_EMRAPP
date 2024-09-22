// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_card_search_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FACardSearchViewModel _$FACardSearchViewModelFromJson(
        Map<String, dynamic> json) =>
    FACardSearchViewModel(
      json['id'] as int,
      json['cardNumber'] as String,
      json['displayCardNumber'] as String,
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
      json['disposedOn'] == null
          ? null
          : DateTime.parse(json['disposedOn'] as String),
      json['disposedBy'] as String,
      (json['bookValue'] as num).toDouble(),
      json['renewalDate'] == null
          ? null
          : DateTime.parse(json['renewalDate'] as String),
      json['description2'] as String,
      json['majorLocation'] as String,
    );

Map<String, dynamic> _$FACardSearchViewModelToJson(
        FACardSearchViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardNumber': instance.cardNumber,
      'displayCardNumber': instance.displayCardNumber,
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
      'disposedOn': instance.disposedOn?.toIso8601String(),
      'disposedBy': instance.disposedBy,
      'bookValue': instance.bookValue,
      'renewalDate': instance.renewalDate?.toIso8601String(),
      'description2': instance.description2,
      'majorLocation': instance.majorLocation,
    };
