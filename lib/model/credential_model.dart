// -- credential_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'credential_model.g.dart';

@JsonSerializable()
class CredentialModel {
  String username;
  String password;
  int branchId;

  CredentialModel(
    this.username,
    this.password,
    this.branchId,
  );

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialModelFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialModelToJson(this);
}
