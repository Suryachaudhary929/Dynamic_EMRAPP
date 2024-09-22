// -- fa_government_renewal_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_government_renewal_view_model.g.dart';

@JsonSerializable()
class FAGovernmentRenewalViewModel {
	DateTime? renewalDate;
	String renewalDateNp;
	double renewalCost;
	double renewalFine;
	double renewalTotalAmount;
	DateTime? renewalEffectiveFromDate;
	String renewalEffectiveFromDateNp;
	DateTime? renewalEffectiveToDate;
	String renewalEffectiveToDateNp;
	int fACardId;
	int id;

	FAGovernmentRenewalViewModel(this.renewalDate,this.renewalDateNp,this.renewalCost,this.renewalFine,this.renewalTotalAmount,this.renewalEffectiveFromDate,this.renewalEffectiveFromDateNp,this.renewalEffectiveToDate,this.renewalEffectiveToDateNp,this.fACardId,this.id,);

	factory FAGovernmentRenewalViewModel.fromJson(Map<String, dynamic> json) => _$FAGovernmentRenewalViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FAGovernmentRenewalViewModelToJson(this);
}
