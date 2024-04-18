import 'package:air_puff/generated/json/base/json_convert_content.dart';
import 'package:air_puff/pages/map/model/air_model_entity.dart';

AirModelEntity $AirModelEntityFromJson(Map<String, dynamic> json) {
  final AirModelEntity airModelEntity = AirModelEntity();
  final int? aqi = jsonConvert.convert<int>(json['aqi']);
  if (aqi != null) {
    airModelEntity.aqi = aqi;
  }
  final int? idx = jsonConvert.convert<int>(json['idx']);
  if (idx != null) {
    airModelEntity.idx = idx;
  }
  final List<
      AirModelAttributions>? attributions = (json['attributions'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AirModelAttributions>(e) as AirModelAttributions)
      .toList();
  if (attributions != null) {
    airModelEntity.attributions = attributions;
  }
  final AirModelCity? city = jsonConvert.convert<AirModelCity>(json['city']);
  if (city != null) {
    airModelEntity.city = city;
  }
  final String? dominentpol = jsonConvert.convert<String>(json['dominentpol']);
  if (dominentpol != null) {
    airModelEntity.dominentpol = dominentpol;
  }
  final AirModelIaqi? iaqi = jsonConvert.convert<AirModelIaqi>(json['iaqi']);
  if (iaqi != null) {
    airModelEntity.iaqi = iaqi;
  }
  final AirModelTime? time = jsonConvert.convert<AirModelTime>(json['time']);
  if (time != null) {
    airModelEntity.time = time;
  }
  final AirModelForecast? forecast = jsonConvert.convert<AirModelForecast>(
      json['forecast']);
  if (forecast != null) {
    airModelEntity.forecast = forecast;
  }
  final AirModelDebug? debug = jsonConvert.convert<AirModelDebug>(
      json['debug']);
  if (debug != null) {
    airModelEntity.debug = debug;
  }
  return airModelEntity;
}

Map<String, dynamic> $AirModelEntityToJson(AirModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['aqi'] = entity.aqi;
  data['idx'] = entity.idx;
  data['attributions'] = entity.attributions?.map((v) => v.toJson()).toList();
  data['city'] = entity.city?.toJson();
  data['dominentpol'] = entity.dominentpol;
  data['iaqi'] = entity.iaqi?.toJson();
  data['time'] = entity.time?.toJson();
  data['forecast'] = entity.forecast?.toJson();
  data['debug'] = entity.debug?.toJson();
  return data;
}

extension AirModelEntityExtension on AirModelEntity {
  AirModelEntity copyWith({
    int? aqi,
    int? idx,
    List<AirModelAttributions>? attributions,
    AirModelCity? city,
    String? dominentpol,
    AirModelIaqi? iaqi,
    AirModelTime? time,
    AirModelForecast? forecast,
    AirModelDebug? debug,
  }) {
    return AirModelEntity()
      ..aqi = aqi ?? this.aqi
      ..idx = idx ?? this.idx
      ..attributions = attributions ?? this.attributions
      ..city = city ?? this.city
      ..dominentpol = dominentpol ?? this.dominentpol
      ..iaqi = iaqi ?? this.iaqi
      ..time = time ?? this.time
      ..forecast = forecast ?? this.forecast
      ..debug = debug ?? this.debug;
  }
}

AirModelAttributions $AirModelAttributionsFromJson(Map<String, dynamic> json) {
  final AirModelAttributions airModelAttributions = AirModelAttributions();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    airModelAttributions.url = url;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    airModelAttributions.name = name;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    airModelAttributions.logo = logo;
  }
  return airModelAttributions;
}

Map<String, dynamic> $AirModelAttributionsToJson(AirModelAttributions entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['name'] = entity.name;
  data['logo'] = entity.logo;
  return data;
}

extension AirModelAttributionsExtension on AirModelAttributions {
  AirModelAttributions copyWith({
    String? url,
    String? name,
    String? logo,
  }) {
    return AirModelAttributions()
      ..url = url ?? this.url
      ..name = name ?? this.name
      ..logo = logo ?? this.logo;
  }
}

AirModelCity $AirModelCityFromJson(Map<String, dynamic> json) {
  final AirModelCity airModelCity = AirModelCity();
  final List<double>? geo = (json['geo'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (geo != null) {
    airModelCity.geo = geo;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    airModelCity.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    airModelCity.url = url;
  }
  final String? location = jsonConvert.convert<String>(json['location']);
  if (location != null) {
    airModelCity.location = location;
  }
  return airModelCity;
}

Map<String, dynamic> $AirModelCityToJson(AirModelCity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['geo'] = entity.geo;
  data['name'] = entity.name;
  data['url'] = entity.url;
  data['location'] = entity.location;
  return data;
}

extension AirModelCityExtension on AirModelCity {
  AirModelCity copyWith({
    List<double>? geo,
    String? name,
    String? url,
    String? location,
  }) {
    return AirModelCity()
      ..geo = geo ?? this.geo
      ..name = name ?? this.name
      ..url = url ?? this.url
      ..location = location ?? this.location;
  }
}

AirModelIaqi $AirModelIaqiFromJson(Map<String, dynamic> json) {
  final AirModelIaqi airModelIaqi = AirModelIaqi();
  final AirModelIaqiCo? co = jsonConvert.convert<AirModelIaqiCo>(json['co']);
  if (co != null) {
    airModelIaqi.co = co;
  }
  final AirModelIaqiH? h = jsonConvert.convert<AirModelIaqiH>(json['h']);
  if (h != null) {
    airModelIaqi.h = h;
  }
  final AirModelIaqiNo2? no2 = jsonConvert.convert<AirModelIaqiNo2>(
      json['no2']);
  if (no2 != null) {
    airModelIaqi.no2 = no2;
  }
  final AirModelIaqiO3? o3 = jsonConvert.convert<AirModelIaqiO3>(json['o3']);
  if (o3 != null) {
    airModelIaqi.o3 = o3;
  }
  final AirModelIaqiP? p = jsonConvert.convert<AirModelIaqiP>(json['p']);
  if (p != null) {
    airModelIaqi.p = p;
  }
  final AirModelIaqiPm10? pm10 = jsonConvert.convert<AirModelIaqiPm10>(
      json['pm10']);
  if (pm10 != null) {
    airModelIaqi.pm10 = pm10;
  }
  final AirModelIaqiPm25? pm25 = jsonConvert.convert<AirModelIaqiPm25>(
      json['pm25']);
  if (pm25 != null) {
    airModelIaqi.pm25 = pm25;
  }
  final AirModelIaqiSo2? so2 = jsonConvert.convert<AirModelIaqiSo2>(
      json['so2']);
  if (so2 != null) {
    airModelIaqi.so2 = so2;
  }
  final AirModelIaqiT? t = jsonConvert.convert<AirModelIaqiT>(json['t']);
  if (t != null) {
    airModelIaqi.t = t;
  }
  final AirModelIaqiW? w = jsonConvert.convert<AirModelIaqiW>(json['w']);
  if (w != null) {
    airModelIaqi.w = w;
  }
  return airModelIaqi;
}

Map<String, dynamic> $AirModelIaqiToJson(AirModelIaqi entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['co'] = entity.co?.toJson();
  data['h'] = entity.h?.toJson();
  data['no2'] = entity.no2?.toJson();
  data['o3'] = entity.o3?.toJson();
  data['p'] = entity.p?.toJson();
  data['pm10'] = entity.pm10?.toJson();
  data['pm25'] = entity.pm25?.toJson();
  data['so2'] = entity.so2?.toJson();
  data['t'] = entity.t?.toJson();
  data['w'] = entity.w?.toJson();
  return data;
}

extension AirModelIaqiExtension on AirModelIaqi {
  AirModelIaqi copyWith({
    AirModelIaqiCo? co,
    AirModelIaqiH? h,
    AirModelIaqiNo2? no2,
    AirModelIaqiO3? o3,
    AirModelIaqiP? p,
    AirModelIaqiPm10? pm10,
    AirModelIaqiPm25? pm25,
    AirModelIaqiSo2? so2,
    AirModelIaqiT? t,
    AirModelIaqiW? w,
  }) {
    return AirModelIaqi()
      ..co = co ?? this.co
      ..h = h ?? this.h
      ..no2 = no2 ?? this.no2
      ..o3 = o3 ?? this.o3
      ..p = p ?? this.p
      ..pm10 = pm10 ?? this.pm10
      ..pm25 = pm25 ?? this.pm25
      ..so2 = so2 ?? this.so2
      ..t = t ?? this.t
      ..w = w ?? this.w;
  }
}

AirModelIaqiCo $AirModelIaqiCoFromJson(Map<String, dynamic> json) {
  final AirModelIaqiCo airModelIaqiCo = AirModelIaqiCo();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiCo.v = v;
  }
  return airModelIaqiCo;
}

Map<String, dynamic> $AirModelIaqiCoToJson(AirModelIaqiCo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiCoExtension on AirModelIaqiCo {
  AirModelIaqiCo copyWith({
    double? v,
  }) {
    return AirModelIaqiCo()
      ..v = v ?? this.v;
  }
}

AirModelIaqiH $AirModelIaqiHFromJson(Map<String, dynamic> json) {
  final AirModelIaqiH airModelIaqiH = AirModelIaqiH();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiH.v = v;
  }
  return airModelIaqiH;
}

Map<String, dynamic> $AirModelIaqiHToJson(AirModelIaqiH entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiHExtension on AirModelIaqiH {
  AirModelIaqiH copyWith({
    double? v,
  }) {
    return AirModelIaqiH()
      ..v = v ?? this.v;
  }
}

AirModelIaqiNo2 $AirModelIaqiNo2FromJson(Map<String, dynamic> json) {
  final AirModelIaqiNo2 airModelIaqiNo2 = AirModelIaqiNo2();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiNo2.v = v;
  }
  return airModelIaqiNo2;
}

Map<String, dynamic> $AirModelIaqiNo2ToJson(AirModelIaqiNo2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiNo2Extension on AirModelIaqiNo2 {
  AirModelIaqiNo2 copyWith({
    double? v,
  }) {
    return AirModelIaqiNo2()
      ..v = v ?? this.v;
  }
}

AirModelIaqiO3 $AirModelIaqiO3FromJson(Map<String, dynamic> json) {
  final AirModelIaqiO3 airModelIaqiO3 = AirModelIaqiO3();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiO3.v = v;
  }
  return airModelIaqiO3;
}

Map<String, dynamic> $AirModelIaqiO3ToJson(AirModelIaqiO3 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiO3Extension on AirModelIaqiO3 {
  AirModelIaqiO3 copyWith({
    double? v,
  }) {
    return AirModelIaqiO3()
      ..v = v ?? this.v;
  }
}

AirModelIaqiP $AirModelIaqiPFromJson(Map<String, dynamic> json) {
  final AirModelIaqiP airModelIaqiP = AirModelIaqiP();
  final int? v = jsonConvert.convert<int>(json['v']);
  if (v != null) {
    airModelIaqiP.v = v;
  }
  return airModelIaqiP;
}

Map<String, dynamic> $AirModelIaqiPToJson(AirModelIaqiP entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiPExtension on AirModelIaqiP {
  AirModelIaqiP copyWith({
    int? v,
  }) {
    return AirModelIaqiP()
      ..v = v ?? this.v;
  }
}

AirModelIaqiPm10 $AirModelIaqiPm10FromJson(Map<String, dynamic> json) {
  final AirModelIaqiPm10 airModelIaqiPm10 = AirModelIaqiPm10();
  final int? v = jsonConvert.convert<int>(json['v']);
  if (v != null) {
    airModelIaqiPm10.v = v;
  }
  return airModelIaqiPm10;
}

Map<String, dynamic> $AirModelIaqiPm10ToJson(AirModelIaqiPm10 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiPm10Extension on AirModelIaqiPm10 {
  AirModelIaqiPm10 copyWith({
    int? v,
  }) {
    return AirModelIaqiPm10()
      ..v = v ?? this.v;
  }
}

AirModelIaqiPm25 $AirModelIaqiPm25FromJson(Map<String, dynamic> json) {
  final AirModelIaqiPm25 airModelIaqiPm25 = AirModelIaqiPm25();
  final int? v = jsonConvert.convert<int>(json['v']);
  if (v != null) {
    airModelIaqiPm25.v = v;
  }
  return airModelIaqiPm25;
}

Map<String, dynamic> $AirModelIaqiPm25ToJson(AirModelIaqiPm25 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiPm25Extension on AirModelIaqiPm25 {
  AirModelIaqiPm25 copyWith({
    int? v,
  }) {
    return AirModelIaqiPm25()
      ..v = v ?? this.v;
  }
}

AirModelIaqiSo2 $AirModelIaqiSo2FromJson(Map<String, dynamic> json) {
  final AirModelIaqiSo2 airModelIaqiSo2 = AirModelIaqiSo2();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiSo2.v = v;
  }
  return airModelIaqiSo2;
}

Map<String, dynamic> $AirModelIaqiSo2ToJson(AirModelIaqiSo2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiSo2Extension on AirModelIaqiSo2 {
  AirModelIaqiSo2 copyWith({
    double? v,
  }) {
    return AirModelIaqiSo2()
      ..v = v ?? this.v;
  }
}

AirModelIaqiT $AirModelIaqiTFromJson(Map<String, dynamic> json) {
  final AirModelIaqiT airModelIaqiT = AirModelIaqiT();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiT.v = v;
  }
  return airModelIaqiT;
}

Map<String, dynamic> $AirModelIaqiTToJson(AirModelIaqiT entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiTExtension on AirModelIaqiT {
  AirModelIaqiT copyWith({
    double? v,
  }) {
    return AirModelIaqiT()
      ..v = v ?? this.v;
  }
}

AirModelIaqiW $AirModelIaqiWFromJson(Map<String, dynamic> json) {
  final AirModelIaqiW airModelIaqiW = AirModelIaqiW();
  final double? v = jsonConvert.convert<double>(json['v']);
  if (v != null) {
    airModelIaqiW.v = v;
  }
  return airModelIaqiW;
}

Map<String, dynamic> $AirModelIaqiWToJson(AirModelIaqiW entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['v'] = entity.v;
  return data;
}

extension AirModelIaqiWExtension on AirModelIaqiW {
  AirModelIaqiW copyWith({
    double? v,
  }) {
    return AirModelIaqiW()
      ..v = v ?? this.v;
  }
}

AirModelTime $AirModelTimeFromJson(Map<String, dynamic> json) {
  final AirModelTime airModelTime = AirModelTime();
  final String? s = jsonConvert.convert<String>(json['s']);
  if (s != null) {
    airModelTime.s = s;
  }
  final String? tz = jsonConvert.convert<String>(json['tz']);
  if (tz != null) {
    airModelTime.tz = tz;
  }
  final int? v = jsonConvert.convert<int>(json['v']);
  if (v != null) {
    airModelTime.v = v;
  }
  final String? iso = jsonConvert.convert<String>(json['iso']);
  if (iso != null) {
    airModelTime.iso = iso;
  }
  return airModelTime;
}

Map<String, dynamic> $AirModelTimeToJson(AirModelTime entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['s'] = entity.s;
  data['tz'] = entity.tz;
  data['v'] = entity.v;
  data['iso'] = entity.iso;
  return data;
}

extension AirModelTimeExtension on AirModelTime {
  AirModelTime copyWith({
    String? s,
    String? tz,
    int? v,
    String? iso,
  }) {
    return AirModelTime()
      ..s = s ?? this.s
      ..tz = tz ?? this.tz
      ..v = v ?? this.v
      ..iso = iso ?? this.iso;
  }
}

AirModelForecast $AirModelForecastFromJson(Map<String, dynamic> json) {
  final AirModelForecast airModelForecast = AirModelForecast();
  final AirModelForecastDaily? daily = jsonConvert.convert<
      AirModelForecastDaily>(json['daily']);
  if (daily != null) {
    airModelForecast.daily = daily;
  }
  return airModelForecast;
}

Map<String, dynamic> $AirModelForecastToJson(AirModelForecast entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['daily'] = entity.daily?.toJson();
  return data;
}

extension AirModelForecastExtension on AirModelForecast {
  AirModelForecast copyWith({
    AirModelForecastDaily? daily,
  }) {
    return AirModelForecast()
      ..daily = daily ?? this.daily;
  }
}

AirModelForecastDaily $AirModelForecastDailyFromJson(
    Map<String, dynamic> json) {
  final AirModelForecastDaily airModelForecastDaily = AirModelForecastDaily();
  final List<AirModelForecastDailyO3>? o3 = (json['o3'] as List<dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<AirModelForecastDailyO3>(
          e) as AirModelForecastDailyO3).toList();
  if (o3 != null) {
    airModelForecastDaily.o3 = o3;
  }
  final List<AirModelForecastDailyPm10>? pm10 = (json['pm10'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AirModelForecastDailyPm10>(
          e) as AirModelForecastDailyPm10)
      .toList();
  if (pm10 != null) {
    airModelForecastDaily.pm10 = pm10;
  }
  final List<AirModelForecastDailyPm25>? pm25 = (json['pm25'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AirModelForecastDailyPm25>(
          e) as AirModelForecastDailyPm25)
      .toList();
  if (pm25 != null) {
    airModelForecastDaily.pm25 = pm25;
  }
  final List<AirModelForecastDailyUvi>? uvi = (json['uvi'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<AirModelForecastDailyUvi>(
          e) as AirModelForecastDailyUvi)
      .toList();
  if (uvi != null) {
    airModelForecastDaily.uvi = uvi;
  }
  return airModelForecastDaily;
}

Map<String, dynamic> $AirModelForecastDailyToJson(
    AirModelForecastDaily entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['o3'] = entity.o3?.map((v) => v.toJson()).toList();
  data['pm10'] = entity.pm10?.map((v) => v.toJson()).toList();
  data['pm25'] = entity.pm25?.map((v) => v.toJson()).toList();
  data['uvi'] = entity.uvi?.map((v) => v.toJson()).toList();
  return data;
}

extension AirModelForecastDailyExtension on AirModelForecastDaily {
  AirModelForecastDaily copyWith({
    List<AirModelForecastDailyO3>? o3,
    List<AirModelForecastDailyPm10>? pm10,
    List<AirModelForecastDailyPm25>? pm25,
    List<AirModelForecastDailyUvi>? uvi,
  }) {
    return AirModelForecastDaily()
      ..o3 = o3 ?? this.o3
      ..pm10 = pm10 ?? this.pm10
      ..pm25 = pm25 ?? this.pm25
      ..uvi = uvi ?? this.uvi;
  }
}

AirModelForecastDailyO3 $AirModelForecastDailyO3FromJson(
    Map<String, dynamic> json) {
  final AirModelForecastDailyO3 airModelForecastDailyO3 = AirModelForecastDailyO3();
  final int? avg = jsonConvert.convert<int>(json['avg']);
  if (avg != null) {
    airModelForecastDailyO3.avg = avg;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    airModelForecastDailyO3.day = day;
  }
  final int? max = jsonConvert.convert<int>(json['max']);
  if (max != null) {
    airModelForecastDailyO3.max = max;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    airModelForecastDailyO3.min = min;
  }
  return airModelForecastDailyO3;
}

Map<String, dynamic> $AirModelForecastDailyO3ToJson(
    AirModelForecastDailyO3 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['avg'] = entity.avg;
  data['day'] = entity.day;
  data['max'] = entity.max;
  data['min'] = entity.min;
  return data;
}

extension AirModelForecastDailyO3Extension on AirModelForecastDailyO3 {
  AirModelForecastDailyO3 copyWith({
    int? avg,
    String? day,
    int? max,
    int? min,
  }) {
    return AirModelForecastDailyO3()
      ..avg = avg ?? this.avg
      ..day = day ?? this.day
      ..max = max ?? this.max
      ..min = min ?? this.min;
  }
}

AirModelForecastDailyPm10 $AirModelForecastDailyPm10FromJson(
    Map<String, dynamic> json) {
  final AirModelForecastDailyPm10 airModelForecastDailyPm10 = AirModelForecastDailyPm10();
  final int? avg = jsonConvert.convert<int>(json['avg']);
  if (avg != null) {
    airModelForecastDailyPm10.avg = avg;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    airModelForecastDailyPm10.day = day;
  }
  final int? max = jsonConvert.convert<int>(json['max']);
  if (max != null) {
    airModelForecastDailyPm10.max = max;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    airModelForecastDailyPm10.min = min;
  }
  return airModelForecastDailyPm10;
}

Map<String, dynamic> $AirModelForecastDailyPm10ToJson(
    AirModelForecastDailyPm10 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['avg'] = entity.avg;
  data['day'] = entity.day;
  data['max'] = entity.max;
  data['min'] = entity.min;
  return data;
}

extension AirModelForecastDailyPm10Extension on AirModelForecastDailyPm10 {
  AirModelForecastDailyPm10 copyWith({
    int? avg,
    String? day,
    int? max,
    int? min,
  }) {
    return AirModelForecastDailyPm10()
      ..avg = avg ?? this.avg
      ..day = day ?? this.day
      ..max = max ?? this.max
      ..min = min ?? this.min;
  }
}

AirModelForecastDailyPm25 $AirModelForecastDailyPm25FromJson(
    Map<String, dynamic> json) {
  final AirModelForecastDailyPm25 airModelForecastDailyPm25 = AirModelForecastDailyPm25();
  final int? avg = jsonConvert.convert<int>(json['avg']);
  if (avg != null) {
    airModelForecastDailyPm25.avg = avg;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    airModelForecastDailyPm25.day = day;
  }
  final int? max = jsonConvert.convert<int>(json['max']);
  if (max != null) {
    airModelForecastDailyPm25.max = max;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    airModelForecastDailyPm25.min = min;
  }
  return airModelForecastDailyPm25;
}

Map<String, dynamic> $AirModelForecastDailyPm25ToJson(
    AirModelForecastDailyPm25 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['avg'] = entity.avg;
  data['day'] = entity.day;
  data['max'] = entity.max;
  data['min'] = entity.min;
  return data;
}

extension AirModelForecastDailyPm25Extension on AirModelForecastDailyPm25 {
  AirModelForecastDailyPm25 copyWith({
    int? avg,
    String? day,
    int? max,
    int? min,
  }) {
    return AirModelForecastDailyPm25()
      ..avg = avg ?? this.avg
      ..day = day ?? this.day
      ..max = max ?? this.max
      ..min = min ?? this.min;
  }
}

AirModelForecastDailyUvi $AirModelForecastDailyUviFromJson(
    Map<String, dynamic> json) {
  final AirModelForecastDailyUvi airModelForecastDailyUvi = AirModelForecastDailyUvi();
  final int? avg = jsonConvert.convert<int>(json['avg']);
  if (avg != null) {
    airModelForecastDailyUvi.avg = avg;
  }
  final String? day = jsonConvert.convert<String>(json['day']);
  if (day != null) {
    airModelForecastDailyUvi.day = day;
  }
  final int? max = jsonConvert.convert<int>(json['max']);
  if (max != null) {
    airModelForecastDailyUvi.max = max;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    airModelForecastDailyUvi.min = min;
  }
  return airModelForecastDailyUvi;
}

Map<String, dynamic> $AirModelForecastDailyUviToJson(
    AirModelForecastDailyUvi entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['avg'] = entity.avg;
  data['day'] = entity.day;
  data['max'] = entity.max;
  data['min'] = entity.min;
  return data;
}

extension AirModelForecastDailyUviExtension on AirModelForecastDailyUvi {
  AirModelForecastDailyUvi copyWith({
    int? avg,
    String? day,
    int? max,
    int? min,
  }) {
    return AirModelForecastDailyUvi()
      ..avg = avg ?? this.avg
      ..day = day ?? this.day
      ..max = max ?? this.max
      ..min = min ?? this.min;
  }
}

AirModelDebug $AirModelDebugFromJson(Map<String, dynamic> json) {
  final AirModelDebug airModelDebug = AirModelDebug();
  final String? sync = jsonConvert.convert<String>(json['sync']);
  if (sync != null) {
    airModelDebug.sync = sync;
  }
  return airModelDebug;
}

Map<String, dynamic> $AirModelDebugToJson(AirModelDebug entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['sync'] = entity.sync;
  return data;
}

extension AirModelDebugExtension on AirModelDebug {
  AirModelDebug copyWith({
    String? sync,
  }) {
    return AirModelDebug()
      ..sync = sync ?? this.sync;
  }
}