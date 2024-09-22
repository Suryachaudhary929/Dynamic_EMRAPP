// -- patient_registration_for_scanner_client_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'patient_registration_for_scanner_client_view_model.g.dart';

@JsonSerializable()
class PatientRegistrationForScannerClientViewModel {
  int registrationId;
  int visitCount;
  DateTime registrationDate;
  String registrationTypeName;
  String department;

  PatientRegistrationForScannerClientViewModel(
    this.registrationId,
    this.visitCount,
    this.registrationDate,
    this.registrationTypeName,
    this.department,
  );

  factory PatientRegistrationForScannerClientViewModel.fromJson(
          Map<String, dynamic> json) =>
      _$PatientRegistrationForScannerClientViewModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PatientRegistrationForScannerClientViewModelToJson(this);
}
