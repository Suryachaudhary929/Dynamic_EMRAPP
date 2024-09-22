// -- fa_depreciation_book_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_depreciation_book_view_model.g.dart';

@JsonSerializable()
class FADepreciationBookViewModel {
	int id;
	String title;
	String description;

	FADepreciationBookViewModel(this.id,this.title,this.description,);

	factory FADepreciationBookViewModel.fromJson(Map<String, dynamic> json) => _$FADepreciationBookViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FADepreciationBookViewModelToJson(this);
}
