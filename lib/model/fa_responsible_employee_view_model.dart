// -- fa_responsible_employee_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_responsible_employee_view_model.g.dart';

@JsonSerializable()
class FAResponsibleEmployeeViewModel {
	int id;
	int employeeId;
	String employee;
	DateTime? fromDate;
	String fromDateNp;
	DateTime? toDate;
	String toDateNp;
	int fACardId;
	int days;

	FAResponsibleEmployeeViewModel(this.id,this.employeeId,this.employee,this.fromDate,this.fromDateNp,this.toDate,this.toDateNp,this.fACardId,this.days,);

	factory FAResponsibleEmployeeViewModel.fromJson(Map<String, dynamic> json) => _$FAResponsibleEmployeeViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FAResponsibleEmployeeViewModelToJson(this);
}