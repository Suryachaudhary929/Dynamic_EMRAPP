// -- fa_maintainance_vendor_info_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_maintainance_vendor_info_view_model.g.dart';

@JsonSerializable()
class FAMaintainanceVendorInfoViewModel {
	int id;
	String title;
	String address;
	String contactPersonName;
	String contactPersonNo;

	FAMaintainanceVendorInfoViewModel(this.id,this.title,this.address,this.contactPersonName,this.contactPersonNo,);

	factory FAMaintainanceVendorInfoViewModel.fromJson(Map<String, dynamic> json) => _$FAMaintainanceVendorInfoViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FAMaintainanceVendorInfoViewModelToJson(this);
}
