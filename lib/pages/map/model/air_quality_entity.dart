import 'package:air_puff/generated/json/air_quality_entity.g.dart';
import 'package:air_puff/generated/json/base/json_field.dart';
import 'package:air_puff/pages/map/model/air_model_entity.dart';
import 'dart:convert';

@JsonSerializable()
class AirQualityEntity {
	late String status;
	late AirModelEntity data;

	AirQualityEntity();

	factory AirQualityEntity.fromJson(Map<String, dynamic> json) => $AirQualityEntityFromJson(json);

	Map<String, dynamic> toJson() => $AirQualityEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}