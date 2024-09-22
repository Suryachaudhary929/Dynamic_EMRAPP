// -- fa_maintainance_info_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_maintainance_info_view_model.g.dart';

@JsonSerializable()
class FAMaintainanceInfoViewModel {
	int vendorId;
	String vendor;
	double charge;
	DateTime? maintainanceFromDate;
	String maintainanceFromDateNp;
	DateTime? maintainanceToDate;
	String maintainanceToDateNp;
	DateTime? nextServiceDate;
	String nextServiceDateNp;
	DateTime? warrantyFromDate;
	String warrantyFromDateNp;
	DateTime? warrantyToDate;
	String warrantyToDateNp;
	int fACardId;
	int id;

	FAMaintainanceInfoViewModel(this.vendorId,this.vendor,this.charge,this.maintainanceFromDate,this.maintainanceFromDateNp,this.maintainanceToDate,this.maintainanceToDateNp,this.nextServiceDate,this.nextServiceDateNp,this.warrantyFromDate,this.warrantyFromDateNp,this.warrantyToDate,this.warrantyToDateNp,this.fACardId,this.id,);

	factory FAMaintainanceInfoViewModel.fromJson(Map<String, dynamic> json) => _$FAMaintainanceInfoViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FAMaintainanceInfoViewModelToJson(this);
}
