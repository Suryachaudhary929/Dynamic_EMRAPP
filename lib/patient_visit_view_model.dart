// -- patient_visit_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'patient_visit_view_model.g.dart';

@JsonSerializable()
class PatientVisitViewModel {
  int registrationId;
  String registrationTypeName;
  int visitCount;
  DateTime registrationDate;
  String department;

  PatientVisitViewModel(
    this.registrationId,
    this.registrationTypeName,
    this.visitCount,
    this.registrationDate,
    this.department,
  );

  factory PatientVisitViewModel.fromJson(Map<String, dynamic> json) =>
      _$PatientVisitViewModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientVisitViewModelToJson(this);
}
