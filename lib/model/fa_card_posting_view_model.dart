// -- fa_card_posting_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

import 'fa_card_insurance_view_model.dart';
import 'fa_card_line_view_model.dart';
import 'fa_component_view_model.dart';
import 'fa_display_card_number_code_for_edit.dart';
import 'fa_government_renewal_view_model.dart';
import 'fa_location_view_model.dart';
import 'fa_maintainance_info_view_model.dart';
import 'fa_responsible_employee_view_model.dart';

part 'fa_card_posting_view_model.g.dart';

@JsonSerializable()
class FACardPostingViewModel {
	int id;
	String cardNumber;
	bool commitDisplayCardNumberSave;
	String displayCardNumber;
	int displayCardNumberSequence;
	String displaySuffix;
	String displayPrefix;
	String description;
	String serialNumber;
	int? responsibleEmployee;
	bool isActive;
	bool isBlocked;
	DateTime? purchasedDate;
	double purchaseQty;
	double purchaseCost;
	double openingBalance;
	String previousFACode;
	int? fAClassCodeId;
	int? fASubClassCodeId;
	bool isUnderMaintenance;
	String fAModel;
	bool disableFALines;
	bool isDisposed;
	double bookValue;
	bool isDonated;
	int? donorId;
	String fundType;
	String description2;
	String unit;
	String unitValue;
	int? fATypeId;
	int? majorLocationId;
	List<FAComponentViewModel> fAComponentDetails;
	List<FACardLineViewModel> fACardLineDetails;
	List<FAResponsibleEmployeeViewModel> fAResponsibleEmployeeDetails;
	List<FALocationViewModel> fALocationDetails;
	List<FAMaintainanceInfoViewModel> fAMaintainanceInfoDetails;
	List<FAGovernmentRenewalViewModel> fAGovernmentRenewalDetails;
	List<FACardInsuranceViewModel> fACardInsuranceDetails;
	FAComponentViewModel fAComponent;
	FACardLineViewModel fACardLine;
	FAResponsibleEmployeeViewModel fAResponsibleEmployee;
	FALocationViewModel fALocation;
	FAMaintainanceInfoViewModel fAMaintainanceInfo;
	FAGovernmentRenewalViewModel fAGovernmentRenewal;
	FACardInsuranceViewModel fACardInsurance;
	FADisplayCardNumberCodeForEdit fADisplayCardNumberCodeForEdit;

	FACardPostingViewModel(this.id,this.cardNumber,this.commitDisplayCardNumberSave,this.displayCardNumber,this.displayCardNumberSequence,this.displaySuffix,this.displayPrefix,this.description,this.serialNumber,this.responsibleEmployee,this.isActive,this.isBlocked,this.purchasedDate,this.purchaseQty,this.purchaseCost,this.openingBalance,this.previousFACode,this.fAClassCodeId,this.fASubClassCodeId,this.isUnderMaintenance,this.fAModel,this.disableFALines,this.isDisposed,this.bookValue,this.isDonated,this.donorId,this.fundType,this.description2,this.unit,this.unitValue,this.fATypeId,this.majorLocationId,this.fAComponentDetails,this.fACardLineDetails,this.fAResponsibleEmployeeDetails,this.fALocationDetails,this.fAMaintainanceInfoDetails,this.fAGovernmentRenewalDetails,this.fACardInsuranceDetails,this.fAComponent,this.fACardLine,this.fAResponsibleEmployee,this.fALocation,this.fAMaintainanceInfo,this.fAGovernmentRenewal,this.fACardInsurance,this.fADisplayCardNumberCodeForEdit,);

	factory FACardPostingViewModel.fromJson(Map<String, dynamic> json) => _$FACardPostingViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FACardPostingViewModelToJson(this);
}
