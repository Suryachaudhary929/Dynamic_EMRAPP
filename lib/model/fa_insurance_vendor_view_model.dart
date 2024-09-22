// -- fa_insurance_vendor_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_insurance_vendor_view_model.g.dart';

@JsonSerializable()
class FAInsuranceVendorViewModel {
	int id;
	String title;
	String address;
	String contactPersonName;
	String contactPersonNo;

	FAInsuranceVendorViewModel(this.id,this.title,this.address,this.contactPersonName,this.contactPersonNo,);

	factory FAInsuranceVendorViewModel.fromJson(Map<String, dynamic> json) => _$FAInsuranceVendorViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FAInsuranceVendorViewModelToJson(this);
}
