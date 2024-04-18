import 'package:air_puff/generated/json/base/json_convert_content.dart';
import 'package:air_puff/pages/map/model/point_entity.dart';

PointEntity $PointEntityFromJson(Map<String, dynamic> json) {
  final PointEntity pointEntity = PointEntity();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    pointEntity.status = status;
  }
  final PointData? data = jsonConvert.convert<PointData>(json['data']);
  if (data != null) {
    pointEntity.data = data;
  }
  return pointEntity;
}

Map<String, dynamic> $PointEntityToJson(PointEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['data'] = entity.data?.toJson();
  return data;
}

extension PointEntityExtension on PointEntity {
  PointEntity copyWith({
    String? status,
    PointData? data,
  }) {
    return PointEntity()
      ..status = status ?? this.status
      ..data = data ?? this.data;
  }
}

PointData $PointDataFromJson(Map<String, dynamic> json) {
  final PointData pointData = PointData();
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    pointData.city = city;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    pointData.state = state;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    pointData.country = country;
  }
  final PointDataLocation? location = jsonConvert.convert<PointDataLocation>(
      json['location']);
  if (location != null) {
    pointData.location = location;
  }
  final List<PointDataForecasts>? forecasts = (json['forecasts'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PointDataForecasts>(e) as PointDataForecasts)
      .toList();
  if (forecasts != null) {
    pointData.forecasts = forecasts;
  }
  final PointDataCurrent? current = jsonConvert.convert<PointDataCurrent>(
      json['current']);
  if (current != null) {
    pointData.current = current;
  }
  final PointDataHistory? history = jsonConvert.convert<PointDataHistory>(
      json['history']);
  if (history != null) {
    pointData.history = history;
  }
  return pointData;
}

Map<String, dynamic> $PointDataToJson(PointData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['city'] = entity.city;
  data['state'] = entity.state;
  data['country'] = entity.country;
  data['location'] = entity.location?.toJson();
  data['forecasts'] = entity.forecasts?.map((v) => v.toJson()).toList();
  data['current'] = entity.current?.toJson();
  data['history'] = entity.history?.toJson();
  return data;
}

extension PointDataExtension on PointData {
  PointData copyWith({
    String? city,
    String? state,
    String? country,
    PointDataLocation? location,
    List<PointDataForecasts>? forecasts,
    PointDataCurrent? current,
    PointDataHistory? history,
  }) {
    return PointData()
      ..city = city ?? this.city
      ..state = state ?? this.state
      ..country = country ?? this.country
      ..location = location ?? this.location
      ..forecasts = forecasts ?? this.forecasts
      ..current = current ?? this.current
      ..history = history ?? this.history;
  }
}

PointDataLocation $PointDataLocationFromJson(Map<String, dynamic> json) {
  final PointDataLocation pointDataLocation = PointDataLocation();
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    pointDataLocation.type = type;
  }
  final List<double>? coordinates = (json['coordinates'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<double>(e) as double)
      .toList();
  if (coordinates != null) {
    pointDataLocation.coordinates = coordinates;
  }
  return pointDataLocation;
}

Map<String, dynamic> $PointDataLocationToJson(PointDataLocation entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['coordinates'] = entity.coordinates;
  return data;
}

extension PointDataLocationExtension on PointDataLocation {
  PointDataLocation copyWith({
    String? type,
    List<double>? coordinates,
  }) {
    return PointDataLocation()
      ..type = type ?? this.type
      ..coordinates = coordinates ?? this.coordinates;
  }
}

PointDataForecasts $PointDataForecastsFromJson(Map<String, dynamic> json) {
  final PointDataForecasts pointDataForecasts = PointDataForecasts();
  final String? ts = jsonConvert.convert<String>(json['ts']);
  if (ts != null) {
    pointDataForecasts.ts = ts;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataForecasts.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataForecasts.aqicn = aqicn;
  }
  final int? tp = jsonConvert.convert<int>(json['tp']);
  if (tp != null) {
    pointDataForecasts.tp = tp;
  }
  final int? tpMin = jsonConvert.convert<int>(json['tp_min']);
  if (tpMin != null) {
    pointDataForecasts.tpMin = tpMin;
  }
  final int? pr = jsonConvert.convert<int>(json['pr']);
  if (pr != null) {
    pointDataForecasts.pr = pr;
  }
  final int? hu = jsonConvert.convert<int>(json['hu']);
  if (hu != null) {
    pointDataForecasts.hu = hu;
  }
  final int? ws = jsonConvert.convert<int>(json['ws']);
  if (ws != null) {
    pointDataForecasts.ws = ws;
  }
  final int? wd = jsonConvert.convert<int>(json['wd']);
  if (wd != null) {
    pointDataForecasts.wd = wd;
  }
  final String? ic = jsonConvert.convert<String>(json['ic']);
  if (ic != null) {
    pointDataForecasts.ic = ic;
  }
  return pointDataForecasts;
}

Map<String, dynamic> $PointDataForecastsToJson(PointDataForecasts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ts'] = entity.ts;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  data['tp'] = entity.tp;
  data['tp_min'] = entity.tpMin;
  data['pr'] = entity.pr;
  data['hu'] = entity.hu;
  data['ws'] = entity.ws;
  data['wd'] = entity.wd;
  data['ic'] = entity.ic;
  return data;
}

extension PointDataForecastsExtension on PointDataForecasts {
  PointDataForecasts copyWith({
    String? ts,
    int? aqius,
    int? aqicn,
    int? tp,
    int? tpMin,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) {
    return PointDataForecasts()
      ..ts = ts ?? this.ts
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn
      ..tp = tp ?? this.tp
      ..tpMin = tpMin ?? this.tpMin
      ..pr = pr ?? this.pr
      ..hu = hu ?? this.hu
      ..ws = ws ?? this.ws
      ..wd = wd ?? this.wd
      ..ic = ic ?? this.ic;
  }
}

PointDataCurrent $PointDataCurrentFromJson(Map<String, dynamic> json) {
  final PointDataCurrent pointDataCurrent = PointDataCurrent();
  final PointDataCurrentWeather? weather = jsonConvert.convert<
      PointDataCurrentWeather>(json['weather']);
  if (weather != null) {
    pointDataCurrent.weather = weather;
  }
  final PointDataCurrentPollution? pollution = jsonConvert.convert<
      PointDataCurrentPollution>(json['pollution']);
  if (pollution != null) {
    pointDataCurrent.pollution = pollution;
  }
  return pointDataCurrent;
}

Map<String, dynamic> $PointDataCurrentToJson(PointDataCurrent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['weather'] = entity.weather?.toJson();
  data['pollution'] = entity.pollution?.toJson();
  return data;
}

extension PointDataCurrentExtension on PointDataCurrent {
  PointDataCurrent copyWith({
    PointDataCurrentWeather? weather,
    PointDataCurrentPollution? pollution,
  }) {
    return PointDataCurrent()
      ..weather = weather ?? this.weather
      ..pollution = pollution ?? this.pollution;
  }
}

PointDataCurrentWeather $PointDataCurrentWeatherFromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentWeather pointDataCurrentWeather = PointDataCurrentWeather();
  final String? ts = jsonConvert.convert<String>(json['ts']);
  if (ts != null) {
    pointDataCurrentWeather.ts = ts;
  }
  final int? tp = jsonConvert.convert<int>(json['tp']);
  if (tp != null) {
    pointDataCurrentWeather.tp = tp;
  }
  final int? pr = jsonConvert.convert<int>(json['pr']);
  if (pr != null) {
    pointDataCurrentWeather.pr = pr;
  }
  final int? hu = jsonConvert.convert<int>(json['hu']);
  if (hu != null) {
    pointDataCurrentWeather.hu = hu;
  }
  final int? ws = jsonConvert.convert<int>(json['ws']);
  if (ws != null) {
    pointDataCurrentWeather.ws = ws;
  }
  final int? wd = jsonConvert.convert<int>(json['wd']);
  if (wd != null) {
    pointDataCurrentWeather.wd = wd;
  }
  final String? ic = jsonConvert.convert<String>(json['ic']);
  if (ic != null) {
    pointDataCurrentWeather.ic = ic;
  }
  return pointDataCurrentWeather;
}

Map<String, dynamic> $PointDataCurrentWeatherToJson(
    PointDataCurrentWeather entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ts'] = entity.ts;
  data['tp'] = entity.tp;
  data['pr'] = entity.pr;
  data['hu'] = entity.hu;
  data['ws'] = entity.ws;
  data['wd'] = entity.wd;
  data['ic'] = entity.ic;
  return data;
}

extension PointDataCurrentWeatherExtension on PointDataCurrentWeather {
  PointDataCurrentWeather copyWith({
    String? ts,
    int? tp,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) {
    return PointDataCurrentWeather()
      ..ts = ts ?? this.ts
      ..tp = tp ?? this.tp
      ..pr = pr ?? this.pr
      ..hu = hu ?? this.hu
      ..ws = ws ?? this.ws
      ..wd = wd ?? this.wd
      ..ic = ic ?? this.ic;
  }
}

PointDataCurrentPollution $PointDataCurrentPollutionFromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentPollution pointDataCurrentPollution = PointDataCurrentPollution();
  final String? ts = jsonConvert.convert<String>(json['ts']);
  if (ts != null) {
    pointDataCurrentPollution.ts = ts;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataCurrentPollution.aqius = aqius;
  }
  final String? mainus = jsonConvert.convert<String>(json['mainus']);
  if (mainus != null) {
    pointDataCurrentPollution.mainus = mainus;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataCurrentPollution.aqicn = aqicn;
  }
  final String? maincn = jsonConvert.convert<String>(json['maincn']);
  if (maincn != null) {
    pointDataCurrentPollution.maincn = maincn;
  }
  final PointDataCurrentPollutionP2? p2 = jsonConvert.convert<
      PointDataCurrentPollutionP2>(json['p2']);
  if (p2 != null) {
    pointDataCurrentPollution.p2 = p2;
  }
  final PointDataCurrentPollutionP1? p1 = jsonConvert.convert<
      PointDataCurrentPollutionP1>(json['p1']);
  if (p1 != null) {
    pointDataCurrentPollution.p1 = p1;
  }
  final PointDataCurrentPollutionN2? n2 = jsonConvert.convert<
      PointDataCurrentPollutionN2>(json['n2']);
  if (n2 != null) {
    pointDataCurrentPollution.n2 = n2;
  }
  final PointDataCurrentPollutionS2? s2 = jsonConvert.convert<
      PointDataCurrentPollutionS2>(json['s2']);
  if (s2 != null) {
    pointDataCurrentPollution.s2 = s2;
  }
  final PointDataCurrentPollutionCo? co = jsonConvert.convert<
      PointDataCurrentPollutionCo>(json['co']);
  if (co != null) {
    pointDataCurrentPollution.co = co;
  }
  return pointDataCurrentPollution;
}

Map<String, dynamic> $PointDataCurrentPollutionToJson(
    PointDataCurrentPollution entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ts'] = entity.ts;
  data['aqius'] = entity.aqius;
  data['mainus'] = entity.mainus;
  data['aqicn'] = entity.aqicn;
  data['maincn'] = entity.maincn;
  data['p2'] = entity.p2?.toJson();
  data['p1'] = entity.p1?.toJson();
  data['n2'] = entity.n2?.toJson();
  data['s2'] = entity.s2?.toJson();
  data['co'] = entity.co?.toJson();
  return data;
}

extension PointDataCurrentPollutionExtension on PointDataCurrentPollution {
  PointDataCurrentPollution copyWith({
    String? ts,
    int? aqius,
    String? mainus,
    int? aqicn,
    String? maincn,
    PointDataCurrentPollutionP2? p2,
    PointDataCurrentPollutionP1? p1,
    PointDataCurrentPollutionN2? n2,
    PointDataCurrentPollutionS2? s2,
    PointDataCurrentPollutionCo? co,
  }) {
    return PointDataCurrentPollution()
      ..ts = ts ?? this.ts
      ..aqius = aqius ?? this.aqius
      ..mainus = mainus ?? this.mainus
      ..aqicn = aqicn ?? this.aqicn
      ..maincn = maincn ?? this.maincn
      ..p2 = p2 ?? this.p2
      ..p1 = p1 ?? this.p1
      ..n2 = n2 ?? this.n2
      ..s2 = s2 ?? this.s2
      ..co = co ?? this.co;
  }
}

PointDataCurrentPollutionP2 $PointDataCurrentPollutionP2FromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentPollutionP2 pointDataCurrentPollutionP2 = PointDataCurrentPollutionP2();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataCurrentPollutionP2.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataCurrentPollutionP2.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataCurrentPollutionP2.aqicn = aqicn;
  }
  return pointDataCurrentPollutionP2;
}

Map<String, dynamic> $PointDataCurrentPollutionP2ToJson(
    PointDataCurrentPollutionP2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataCurrentPollutionP2Extension on PointDataCurrentPollutionP2 {
  PointDataCurrentPollutionP2 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataCurrentPollutionP2()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataCurrentPollutionP1 $PointDataCurrentPollutionP1FromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentPollutionP1 pointDataCurrentPollutionP1 = PointDataCurrentPollutionP1();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataCurrentPollutionP1.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataCurrentPollutionP1.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataCurrentPollutionP1.aqicn = aqicn;
  }
  return pointDataCurrentPollutionP1;
}

Map<String, dynamic> $PointDataCurrentPollutionP1ToJson(
    PointDataCurrentPollutionP1 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataCurrentPollutionP1Extension on PointDataCurrentPollutionP1 {
  PointDataCurrentPollutionP1 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataCurrentPollutionP1()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataCurrentPollutionN2 $PointDataCurrentPollutionN2FromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentPollutionN2 pointDataCurrentPollutionN2 = PointDataCurrentPollutionN2();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataCurrentPollutionN2.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataCurrentPollutionN2.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataCurrentPollutionN2.aqicn = aqicn;
  }
  return pointDataCurrentPollutionN2;
}

Map<String, dynamic> $PointDataCurrentPollutionN2ToJson(
    PointDataCurrentPollutionN2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataCurrentPollutionN2Extension on PointDataCurrentPollutionN2 {
  PointDataCurrentPollutionN2 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataCurrentPollutionN2()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataCurrentPollutionS2 $PointDataCurrentPollutionS2FromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentPollutionS2 pointDataCurrentPollutionS2 = PointDataCurrentPollutionS2();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataCurrentPollutionS2.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataCurrentPollutionS2.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataCurrentPollutionS2.aqicn = aqicn;
  }
  return pointDataCurrentPollutionS2;
}

Map<String, dynamic> $PointDataCurrentPollutionS2ToJson(
    PointDataCurrentPollutionS2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataCurrentPollutionS2Extension on PointDataCurrentPollutionS2 {
  PointDataCurrentPollutionS2 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataCurrentPollutionS2()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataCurrentPollutionCo $PointDataCurrentPollutionCoFromJson(
    Map<String, dynamic> json) {
  final PointDataCurrentPollutionCo pointDataCurrentPollutionCo = PointDataCurrentPollutionCo();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataCurrentPollutionCo.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataCurrentPollutionCo.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataCurrentPollutionCo.aqicn = aqicn;
  }
  return pointDataCurrentPollutionCo;
}

Map<String, dynamic> $PointDataCurrentPollutionCoToJson(
    PointDataCurrentPollutionCo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataCurrentPollutionCoExtension on PointDataCurrentPollutionCo {
  PointDataCurrentPollutionCo copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataCurrentPollutionCo()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataHistory $PointDataHistoryFromJson(Map<String, dynamic> json) {
  final PointDataHistory pointDataHistory = PointDataHistory();
  final List<PointDataHistoryWeather>? weather = (json['weather'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PointDataHistoryWeather>(
          e) as PointDataHistoryWeather).toList();
  if (weather != null) {
    pointDataHistory.weather = weather;
  }
  final List<PointDataHistoryPollution>? pollution = (json['pollution'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PointDataHistoryPollution>(
          e) as PointDataHistoryPollution).toList();
  if (pollution != null) {
    pointDataHistory.pollution = pollution;
  }
  return pointDataHistory;
}

Map<String, dynamic> $PointDataHistoryToJson(PointDataHistory entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['weather'] = entity.weather?.map((v) => v.toJson()).toList();
  data['pollution'] = entity.pollution?.map((v) => v.toJson()).toList();
  return data;
}

extension PointDataHistoryExtension on PointDataHistory {
  PointDataHistory copyWith({
    List<PointDataHistoryWeather>? weather,
    List<PointDataHistoryPollution>? pollution,
  }) {
    return PointDataHistory()
      ..weather = weather ?? this.weather
      ..pollution = pollution ?? this.pollution;
  }
}

PointDataHistoryWeather $PointDataHistoryWeatherFromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryWeather pointDataHistoryWeather = PointDataHistoryWeather();
  final String? ts = jsonConvert.convert<String>(json['ts']);
  if (ts != null) {
    pointDataHistoryWeather.ts = ts;
  }
  final int? tp = jsonConvert.convert<int>(json['tp']);
  if (tp != null) {
    pointDataHistoryWeather.tp = tp;
  }
  final int? pr = jsonConvert.convert<int>(json['pr']);
  if (pr != null) {
    pointDataHistoryWeather.pr = pr;
  }
  final int? hu = jsonConvert.convert<int>(json['hu']);
  if (hu != null) {
    pointDataHistoryWeather.hu = hu;
  }
  final int? ws = jsonConvert.convert<int>(json['ws']);
  if (ws != null) {
    pointDataHistoryWeather.ws = ws;
  }
  final int? wd = jsonConvert.convert<int>(json['wd']);
  if (wd != null) {
    pointDataHistoryWeather.wd = wd;
  }
  final String? ic = jsonConvert.convert<String>(json['ic']);
  if (ic != null) {
    pointDataHistoryWeather.ic = ic;
  }
  return pointDataHistoryWeather;
}

Map<String, dynamic> $PointDataHistoryWeatherToJson(
    PointDataHistoryWeather entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ts'] = entity.ts;
  data['tp'] = entity.tp;
  data['pr'] = entity.pr;
  data['hu'] = entity.hu;
  data['ws'] = entity.ws;
  data['wd'] = entity.wd;
  data['ic'] = entity.ic;
  return data;
}

extension PointDataHistoryWeatherExtension on PointDataHistoryWeather {
  PointDataHistoryWeather copyWith({
    String? ts,
    int? tp,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) {
    return PointDataHistoryWeather()
      ..ts = ts ?? this.ts
      ..tp = tp ?? this.tp
      ..pr = pr ?? this.pr
      ..hu = hu ?? this.hu
      ..ws = ws ?? this.ws
      ..wd = wd ?? this.wd
      ..ic = ic ?? this.ic;
  }
}

PointDataHistoryPollution $PointDataHistoryPollutionFromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryPollution pointDataHistoryPollution = PointDataHistoryPollution();
  final String? ts = jsonConvert.convert<String>(json['ts']);
  if (ts != null) {
    pointDataHistoryPollution.ts = ts;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataHistoryPollution.aqius = aqius;
  }
  final String? mainus = jsonConvert.convert<String>(json['mainus']);
  if (mainus != null) {
    pointDataHistoryPollution.mainus = mainus;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataHistoryPollution.aqicn = aqicn;
  }
  final String? maincn = jsonConvert.convert<String>(json['maincn']);
  if (maincn != null) {
    pointDataHistoryPollution.maincn = maincn;
  }
  final PointDataHistoryPollutionP2? p2 = jsonConvert.convert<
      PointDataHistoryPollutionP2>(json['p2']);
  if (p2 != null) {
    pointDataHistoryPollution.p2 = p2;
  }
  final PointDataHistoryPollutionP1? p1 = jsonConvert.convert<
      PointDataHistoryPollutionP1>(json['p1']);
  if (p1 != null) {
    pointDataHistoryPollution.p1 = p1;
  }
  final PointDataHistoryPollutionN2? n2 = jsonConvert.convert<
      PointDataHistoryPollutionN2>(json['n2']);
  if (n2 != null) {
    pointDataHistoryPollution.n2 = n2;
  }
  final PointDataHistoryPollutionS2? s2 = jsonConvert.convert<
      PointDataHistoryPollutionS2>(json['s2']);
  if (s2 != null) {
    pointDataHistoryPollution.s2 = s2;
  }
  final PointDataHistoryPollutionCo? co = jsonConvert.convert<
      PointDataHistoryPollutionCo>(json['co']);
  if (co != null) {
    pointDataHistoryPollution.co = co;
  }
  return pointDataHistoryPollution;
}

Map<String, dynamic> $PointDataHistoryPollutionToJson(
    PointDataHistoryPollution entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ts'] = entity.ts;
  data['aqius'] = entity.aqius;
  data['mainus'] = entity.mainus;
  data['aqicn'] = entity.aqicn;
  data['maincn'] = entity.maincn;
  data['p2'] = entity.p2?.toJson();
  data['p1'] = entity.p1?.toJson();
  data['n2'] = entity.n2?.toJson();
  data['s2'] = entity.s2?.toJson();
  data['co'] = entity.co?.toJson();
  return data;
}

extension PointDataHistoryPollutionExtension on PointDataHistoryPollution {
  PointDataHistoryPollution copyWith({
    String? ts,
    int? aqius,
    String? mainus,
    int? aqicn,
    String? maincn,
    PointDataHistoryPollutionP2? p2,
    PointDataHistoryPollutionP1? p1,
    PointDataHistoryPollutionN2? n2,
    PointDataHistoryPollutionS2? s2,
    PointDataHistoryPollutionCo? co,
  }) {
    return PointDataHistoryPollution()
      ..ts = ts ?? this.ts
      ..aqius = aqius ?? this.aqius
      ..mainus = mainus ?? this.mainus
      ..aqicn = aqicn ?? this.aqicn
      ..maincn = maincn ?? this.maincn
      ..p2 = p2 ?? this.p2
      ..p1 = p1 ?? this.p1
      ..n2 = n2 ?? this.n2
      ..s2 = s2 ?? this.s2
      ..co = co ?? this.co;
  }
}

PointDataHistoryPollutionP2 $PointDataHistoryPollutionP2FromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryPollutionP2 pointDataHistoryPollutionP2 = PointDataHistoryPollutionP2();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataHistoryPollutionP2.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataHistoryPollutionP2.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataHistoryPollutionP2.aqicn = aqicn;
  }
  return pointDataHistoryPollutionP2;
}

Map<String, dynamic> $PointDataHistoryPollutionP2ToJson(
    PointDataHistoryPollutionP2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataHistoryPollutionP2Extension on PointDataHistoryPollutionP2 {
  PointDataHistoryPollutionP2 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataHistoryPollutionP2()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataHistoryPollutionP1 $PointDataHistoryPollutionP1FromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryPollutionP1 pointDataHistoryPollutionP1 = PointDataHistoryPollutionP1();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataHistoryPollutionP1.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataHistoryPollutionP1.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataHistoryPollutionP1.aqicn = aqicn;
  }
  return pointDataHistoryPollutionP1;
}

Map<String, dynamic> $PointDataHistoryPollutionP1ToJson(
    PointDataHistoryPollutionP1 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataHistoryPollutionP1Extension on PointDataHistoryPollutionP1 {
  PointDataHistoryPollutionP1 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataHistoryPollutionP1()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataHistoryPollutionN2 $PointDataHistoryPollutionN2FromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryPollutionN2 pointDataHistoryPollutionN2 = PointDataHistoryPollutionN2();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataHistoryPollutionN2.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataHistoryPollutionN2.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataHistoryPollutionN2.aqicn = aqicn;
  }
  return pointDataHistoryPollutionN2;
}

Map<String, dynamic> $PointDataHistoryPollutionN2ToJson(
    PointDataHistoryPollutionN2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataHistoryPollutionN2Extension on PointDataHistoryPollutionN2 {
  PointDataHistoryPollutionN2 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataHistoryPollutionN2()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataHistoryPollutionS2 $PointDataHistoryPollutionS2FromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryPollutionS2 pointDataHistoryPollutionS2 = PointDataHistoryPollutionS2();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataHistoryPollutionS2.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataHistoryPollutionS2.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataHistoryPollutionS2.aqicn = aqicn;
  }
  return pointDataHistoryPollutionS2;
}

Map<String, dynamic> $PointDataHistoryPollutionS2ToJson(
    PointDataHistoryPollutionS2 entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataHistoryPollutionS2Extension on PointDataHistoryPollutionS2 {
  PointDataHistoryPollutionS2 copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataHistoryPollutionS2()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}

PointDataHistoryPollutionCo $PointDataHistoryPollutionCoFromJson(
    Map<String, dynamic> json) {
  final PointDataHistoryPollutionCo pointDataHistoryPollutionCo = PointDataHistoryPollutionCo();
  final int? conc = jsonConvert.convert<int>(json['conc']);
  if (conc != null) {
    pointDataHistoryPollutionCo.conc = conc;
  }
  final int? aqius = jsonConvert.convert<int>(json['aqius']);
  if (aqius != null) {
    pointDataHistoryPollutionCo.aqius = aqius;
  }
  final int? aqicn = jsonConvert.convert<int>(json['aqicn']);
  if (aqicn != null) {
    pointDataHistoryPollutionCo.aqicn = aqicn;
  }
  return pointDataHistoryPollutionCo;
}

Map<String, dynamic> $PointDataHistoryPollutionCoToJson(
    PointDataHistoryPollutionCo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['conc'] = entity.conc;
  data['aqius'] = entity.aqius;
  data['aqicn'] = entity.aqicn;
  return data;
}

extension PointDataHistoryPollutionCoExtension on PointDataHistoryPollutionCo {
  PointDataHistoryPollutionCo copyWith({
    int? conc,
    int? aqius,
    int? aqicn,
  }) {
    return PointDataHistoryPollutionCo()
      ..conc = conc ?? this.conc
      ..aqius = aqius ?? this.aqius
      ..aqicn = aqicn ?? this.aqicn;
  }
}