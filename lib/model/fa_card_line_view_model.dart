// -- fa_card_line_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_card_line_view_model.g.dart';

@JsonSerializable()
class FACardLineViewModel {
	int depreciationBookId;
	int fAPostingGroupId;
	int depreciationMethodId;
	String depreciationMethod;
	DateTime? depreciationStartingDate;
	DateTime? depreciationEndingDate;
	double rate;
	int noOfDepreciationYears;
	int noOfDepreciationMonths;
	String fAPostingGroup;
	String depreciationBook;
	int fACardId;
	int id;

	FACardLineViewModel(this.depreciationBookId,this.fAPostingGroupId,this.depreciationMethodId,this.depreciationMethod,this.depreciationStartingDate,this.depreciationEndingDate,this.rate,this.noOfDepreciationYears,this.noOfDepreciationMonths,this.fAPostingGroup,this.depreciationBook,this.fACardId,this.id,);

	factory FACardLineViewModel.fromJson(Map<String, dynamic> json) => _$FACardLineViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FACardLineViewModelToJson(this);
}
