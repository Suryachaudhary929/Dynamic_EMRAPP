import 'package:json_annotation/json_annotation.dart';
part 'branch.g.dart';

@JsonSerializable()
class Branch {
  int id;
  String branchName;

  Branch(
    this.id,
    this.branchName,
  );

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}
