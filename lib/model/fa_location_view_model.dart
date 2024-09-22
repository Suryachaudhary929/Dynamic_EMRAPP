// -- fa_location_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_location_view_model.g.dart';

@JsonSerializable()
class FALocationViewModel {
	int id;
	int locationCodeId;
	String locationCode;
	int faDepartmentId;
	String faDepartment;
	DateTime? fromDate;
	String fromDateNp;
	DateTime? toDate;
	String toDateNp;
	int fACardId;
	int days;

	FALocationViewModel(this.id,this.locationCodeId,this.locationCode,this.faDepartmentId,this.faDepartment,this.fromDate,this.fromDateNp,this.toDate,this.toDateNp,this.fACardId,this.days,);

	factory FALocationViewModel.fromJson(Map<String, dynamic> json) => _$FALocationViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FALocationViewModelToJson(this);
}

