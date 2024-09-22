// -- patients_model.dart --
import 'package:json_annotation/json_annotation.dart';

import 'patient_visit_view_model.dart';

part 'patients_model.g.dart';

@JsonSerializable()
class PatientsModel {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String fullName;
  List<PatientVisitViewModel> visits;

  PatientsModel(
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.visits,
  );

  factory PatientsModel.fromJson(Map<String, dynamic> json) =>
      _$PatientsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientsModelToJson(this);
}
