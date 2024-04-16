import 'package:shengyu_weather_forecast/generated/json/base/json_convert_content.dart';
import 'package:shengyu_weather_forecast/pages/map/model/air_quality_entity.dart';
import 'package:shengyu_weather_forecast/pages/map/model/air_model_entity.dart';


AirQualityEntity $AirQualityEntityFromJson(Map<String, dynamic> json) {
  final AirQualityEntity airQualityEntity = AirQualityEntity();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    airQualityEntity.status = status;
  }
  final AirModelEntity? data = jsonConvert.convert<AirModelEntity>(
      json['data']);
  if (data != null) {
    airQualityEntity.data = data;
  }
  return airQualityEntity;
}

Map<String, dynamic> $AirQualityEntityToJson(AirQualityEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['data'] = entity.data.toJson();
  return data;
}

extension AirQualityEntityExtension on AirQualityEntity {
  AirQualityEntity copyWith({
    String? status,
    AirModelEntity? data,
  }) {
    return AirQualityEntity()
      ..status = status ?? this.status
      ..data = data ?? this.data;
  }
}