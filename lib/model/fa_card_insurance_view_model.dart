// -- fa_card_insurance_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_card_insurance_view_model.g.dart';

@JsonSerializable()
class FACardInsuranceViewModel {
	int? insuranceVendorId;
	double insuranceCost;
	double insuranceFine;
	double insuranceTotalAmount;
	bool isInsured;
	String agentName;
	String contactNo;
	String insuranceNo;
	DateTime? insuranceIssueDate;
	String insuranceIssueDateNp;
	DateTime? insuranceExpireDate;
	String insuranceExpireDateNp;
	String insuranceVendor;
	int fACardId;
	int id;

	FACardInsuranceViewModel(this.insuranceVendorId,this.insuranceCost,this.insuranceFine,this.insuranceTotalAmount,this.isInsured,this.agentName,this.contactNo,this.insuranceNo,this.insuranceIssueDate,this.insuranceIssueDateNp,this.insuranceExpireDate,this.insuranceExpireDateNp,this.insuranceVendor,this.fACardId,this.id,);

	factory FACardInsuranceViewModel.fromJson(Map<String, dynamic> json) => _$FACardInsuranceViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FACardInsuranceViewModelToJson(this);
}
