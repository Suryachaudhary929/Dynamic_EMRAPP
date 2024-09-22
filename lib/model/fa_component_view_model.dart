// -- fa_component_view_model.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_component_view_model.g.dart';

@JsonSerializable()
class FAComponentViewModel {
	int fACardComponentId;
	String fACardComponentNo;
	int fACardId;

	FAComponentViewModel(this.fACardComponentId,this.fACardComponentNo,this.fACardId,);

	factory FAComponentViewModel.fromJson(Map<String, dynamic> json) => _$FAComponentViewModelFromJson(json);

	Map<String, dynamic> toJson() => _$FAComponentViewModelToJson(this);
}
