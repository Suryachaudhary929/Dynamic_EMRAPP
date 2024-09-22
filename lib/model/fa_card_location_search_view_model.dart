// -- fa_card_location_search_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_card_location_search_view_model.g.dart';

@JsonSerializable()
class FACardLocationSearchViewModel {
	int id;
	String cardNumber;
	int cardNumberSequence;
	String description;
	String serialNumber;
	String responsibleEmployee;
	String currentLocation;
	bool isActive;
	bool isBlocked;
	String previousFACode;
	String fAClass;
	String fASubClass;
	bool isUnderMaintenance;
	String model;
	int productId;
	bool isDisposed;
	DateTime? fromDate;

	FACardLocationSearchViewModel(this.id,this.cardNumber,this.cardNumberSequence,this.description,this.serialNumber,this.responsibleEmployee,this.currentLocation,this.isActive,this.isBlocked,this.previousFACode,this.fAClass,this.fASubClass,this.isUnderMaintenance,this.model,this.productId,this.isDisposed,this.fromDate,);

	factory FACardLocationSearchViewModel.fromJson(Map<String, dynamic> json) => _$FACardLocationSearchViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FACardLocationSearchViewModelToJson(this);
}
