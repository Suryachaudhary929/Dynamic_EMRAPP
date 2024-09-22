// -- scan_document_dto.dart --
import 'package:json_annotation/json_annotation.dart';

part 'scan_document_dto.g.dart';

@JsonSerializable()
class ScanDocumentDto {
	String? uploadFile;
	int? sortIndex;
	int? patientRegistrationId;

	ScanDocumentDto(this.uploadFile,this.sortIndex,this.patientRegistrationId,);

	factory ScanDocumentDto.fromJson(Map<String, dynamic> json) => _$ScanDocumentDtoFromJson(json);

	Map<String, dynamic> toJson() => _$ScanDocumentDtoToJson(this);
}
