// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fa_responsible_employee_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FAResponsibleEmployeeViewModel _$FAResponsibleEmployeeViewModelFromJson(
        Map<String, dynamic> json) =>
    FAResponsibleEmployeeViewModel(
      json['id'] as int,
      json['employeeId'] as int,
      json['employee'] as String,
      json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      json['fromDateNp'] as String,
      json['toDate'] == null ? null : DateTime.parse(json['toDate'] as String),
      json['toDateNp'] as String,
      json['fACardId'] as int,
      json['days'] as int,
    );

Map<String, dynamic> _$FAResponsibleEmployeeViewModelToJson(
        FAResponsibleEmployeeViewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'employee': instance.employee,
      'fromDate': instance.fromDate?.toIso8601String(),
      'fromDateNp': instance.fromDateNp,
      'toDate': instance.toDate?.toIso8601String(),
      'toDateNp': instance.toDateNp,
      'fACardId': instance.fACardId,
      'days': instance.days,
    };
