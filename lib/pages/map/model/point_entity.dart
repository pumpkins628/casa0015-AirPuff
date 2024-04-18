import 'package:air_puff/generated/json/base/json_field.dart';
import 'package:air_puff/generated/json/point_entity.g.dart';
import 'dart:convert';
export 'package:air_puff/generated/json/point_entity.g.dart';

@JsonSerializable()
class PointEntity {
  String? status;
  PointData? data;

  PointEntity();

  factory PointEntity.fromJson(Map<String, dynamic> json) =>
      $PointEntityFromJson(json);

  Map<String, dynamic> toJson() => $PointEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointData {
  String? city;
  String? state;
  String? country;
  PointDataLocation? location;
  List<PointDataForecasts>? forecasts;
  PointDataCurrent? current;
  PointDataHistory? history;

  PointData();

  factory PointData.fromJson(Map<String, dynamic> json) =>
      $PointDataFromJson(json);

  Map<String, dynamic> toJson() => $PointDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataLocation {
  String? type;
  List<double>? coordinates;

  PointDataLocation();

  factory PointDataLocation.fromJson(Map<String, dynamic> json) =>
      $PointDataLocationFromJson(json);

  Map<String, dynamic> toJson() => $PointDataLocationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataForecasts {
  String? ts;
  int? aqius;
  int? aqicn;
  int? tp;
  @JSONField(name: "tp_min")
  int? tpMin;
  int? pr;
  int? hu;
  int? ws;
  int? wd;
  String? ic;

  PointDataForecasts();

  factory PointDataForecasts.fromJson(Map<String, dynamic> json) =>
      $PointDataForecastsFromJson(json);

  Map<String, dynamic> toJson() => $PointDataForecastsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrent {
  PointDataCurrentWeather? weather;
  PointDataCurrentPollution? pollution;

  PointDataCurrent();

  factory PointDataCurrent.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentFromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentWeather {
  String? ts;
  int? tp;
  int? pr;
  int? hu;
  int? ws;
  int? wd;
  String? ic;

  PointDataCurrentWeather();

  factory PointDataCurrentWeather.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentPollution {
  String? ts;
  int? aqius;
  String? mainus;
  int? aqicn;
  String? maincn;
  PointDataCurrentPollutionP2? p2;
  PointDataCurrentPollutionP1? p1;
  PointDataCurrentPollutionN2? n2;
  PointDataCurrentPollutionS2? s2;
  PointDataCurrentPollutionCo? co;

  PointDataCurrentPollution();

  factory PointDataCurrentPollution.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentPollutionFromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentPollutionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentPollutionP2 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataCurrentPollutionP2();

  factory PointDataCurrentPollutionP2.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentPollutionP2FromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentPollutionP2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentPollutionP1 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataCurrentPollutionP1();

  factory PointDataCurrentPollutionP1.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentPollutionP1FromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentPollutionP1ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentPollutionN2 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataCurrentPollutionN2();

  factory PointDataCurrentPollutionN2.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentPollutionN2FromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentPollutionN2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentPollutionS2 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataCurrentPollutionS2();

  factory PointDataCurrentPollutionS2.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentPollutionS2FromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentPollutionS2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataCurrentPollutionCo {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataCurrentPollutionCo();

  factory PointDataCurrentPollutionCo.fromJson(Map<String, dynamic> json) =>
      $PointDataCurrentPollutionCoFromJson(json);

  Map<String, dynamic> toJson() => $PointDataCurrentPollutionCoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistory {
  List<PointDataHistoryWeather>? weather;
  List<PointDataHistoryPollution>? pollution;

  PointDataHistory();

  factory PointDataHistory.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryFromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryWeather {
  String? ts;
  int? tp;
  int? pr;
  int? hu;
  int? ws;
  int? wd;
  String? ic;

  PointDataHistoryWeather();

  factory PointDataHistoryWeather.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryWeatherFromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryWeatherToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryPollution {
  String? ts;
  int? aqius;
  String? mainus;
  int? aqicn;
  String? maincn;
  PointDataHistoryPollutionP2? p2;
  PointDataHistoryPollutionP1? p1;
  PointDataHistoryPollutionN2? n2;
  PointDataHistoryPollutionS2? s2;
  PointDataHistoryPollutionCo? co;

  PointDataHistoryPollution();

  factory PointDataHistoryPollution.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryPollutionFromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryPollutionToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryPollutionP2 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataHistoryPollutionP2();

  factory PointDataHistoryPollutionP2.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryPollutionP2FromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryPollutionP2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryPollutionP1 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataHistoryPollutionP1();

  factory PointDataHistoryPollutionP1.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryPollutionP1FromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryPollutionP1ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryPollutionN2 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataHistoryPollutionN2();

  factory PointDataHistoryPollutionN2.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryPollutionN2FromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryPollutionN2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryPollutionS2 {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataHistoryPollutionS2();

  factory PointDataHistoryPollutionS2.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryPollutionS2FromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryPollutionS2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PointDataHistoryPollutionCo {
  int? conc;
  int? aqius;
  int? aqicn;

  PointDataHistoryPollutionCo();

  factory PointDataHistoryPollutionCo.fromJson(Map<String, dynamic> json) =>
      $PointDataHistoryPollutionCoFromJson(json);

  Map<String, dynamic> toJson() => $PointDataHistoryPollutionCoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
