// -- fa_card_search_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_card_search_view_model.g.dart';

@JsonSerializable()
class FACardSearchViewModel {
	int id;
	String cardNumber;
	String displayCardNumber;
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
	DateTime? disposedOn;
	String disposedBy;
	double bookValue;
	DateTime? renewalDate;
	String description2;
	String majorLocation;

	FACardSearchViewModel(this.id,this.cardNumber,this.displayCardNumber,this.cardNumberSequence,this.description,this.serialNumber,this.responsibleEmployee,this.currentLocation,this.isActive,this.isBlocked,this.previousFACode,this.fAClass,this.fASubClass,this.isUnderMaintenance,this.model,this.productId,this.isDisposed,this.disposedOn,this.disposedBy,this.bookValue,this.renewalDate,this.description2,this.majorLocation,);

	factory FACardSearchViewModel.fromJson(Map<String, dynamic> json) => _$FACardSearchViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FACardSearchViewModelToJson(this);
}
