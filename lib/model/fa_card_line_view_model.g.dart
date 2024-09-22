// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_card_line_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FACardLineViewModel _$FACardLineViewModelFromJson(Map<String, dynamic> json) =>
    FACardLineViewModel(
      json['depreciationBookId'] as int,
      json['fAPostingGroupId'] as int,
      json['depreciationMethodId'] as int,
      json['depreciationMethod'] as String,
      json['depreciationStartingDate'] == null
          ? null
          : DateTime.parse(json['depreciationStartingDate'] as String),
      json['depreciationEndingDate'] == null
          ? null
          : DateTime.parse(json['depreciationEndingDate'] as String),
      (json['rate'] as num).toDouble(),
      json['noOfDepreciationYears'] as int,
      json['noOfDepreciationMonths'] as int,
      json['fAPostingGroup'] as String,
      json['depreciationBook'] as String,
      json['fACardId'] as int,
      json['id'] as int,
    );

Map<String, dynamic> _$FACardLineViewModelToJson(
        FACardLineViewModel instance) =>
    <String, dynamic>{
      'depreciationBookId': instance.depreciationBookId,
      'fAPostingGroupId': instance.fAPostingGroupId,
      'depreciationMethodId': instance.depreciationMethodId,
      'depreciationMethod': instance.depreciationMethod,
      'depreciationStartingDate':
          instance.depreciationStartingDate?.toIso8601String(),
      'depreciationEndingDate':
          instance.depreciationEndingDate?.toIso8601String(),
      'rate': instance.rate,
      'noOfDepreciationYears': instance.noOfDepreciationYears,
      'noOfDepreciationMonths': instance.noOfDepreciationMonths,
      'fAPostingGroup': instance.fAPostingGroup,
      'depreciationBook': instance.depreciationBook,
      'fACardId': instance.fACardId,
      'id': instance.id,
    };
