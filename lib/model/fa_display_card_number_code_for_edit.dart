// -- fa_display_card_number_code_for_edit.dart --
import 'package:json_annotation/json_annotation.dart';

part 'fa_display_card_number_code_for_edit.g.dart';

@JsonSerializable()
class FADisplayCardNumberCodeForEdit {
	String fADeptCode;
	String fAClassCode;
	String mLocation;
	String type;

	FADisplayCardNumberCodeForEdit(this.fADeptCode,this.fAClassCode,this.mLocation,this.type,);

	factory FADisplayCardNumberCodeForEdit.fromJson(Map<String, dynamic> json) => _$FADisplayCardNumberCodeForEditFromJson(json);

	Map<String, dynamic> toJson() => _$FADisplayCardNumberCodeForEditToJson(this);
}
