import 'package:air_puff/generated/json/base/json_field.dart';
import 'package:air_puff/generated/json/air_model_entity.g.dart';
import 'dart:convert';
export 'package:air_puff/generated/json/air_model_entity.g.dart';

@JsonSerializable()
class AirModelEntity {
  int? aqi;
  int? idx;
  List<AirModelAttributions>? attributions;
  AirModelCity? city;
  String? dominentpol;
  AirModelIaqi? iaqi;
  AirModelTime? time;
  AirModelForecast? forecast;
  AirModelDebug? debug;

  AirModelEntity();

  factory AirModelEntity.fromJson(Map<String, dynamic> json) =>
      $AirModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $AirModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelAttributions {
  String? url;
  String? name;
  String? logo;

  AirModelAttributions();

  factory AirModelAttributions.fromJson(Map<String, dynamic> json) =>
      $AirModelAttributionsFromJson(json);

  Map<String, dynamic> toJson() => $AirModelAttributionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelCity {
  List<double>? geo;
  String? name;
  String? url;
  String? location;

  AirModelCity();

  factory AirModelCity.fromJson(Map<String, dynamic> json) =>
      $AirModelCityFromJson(json);

  Map<String, dynamic> toJson() => $AirModelCityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqi {
  AirModelIaqiCo? co;
  AirModelIaqiH? h;
  AirModelIaqiNo2? no2;
  AirModelIaqiO3? o3;
  AirModelIaqiP? p;
  AirModelIaqiPm10? pm10;
  AirModelIaqiPm25? pm25;
  AirModelIaqiSo2? so2;
  AirModelIaqiT? t;
  AirModelIaqiW? w;

  AirModelIaqi();

  factory AirModelIaqi.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiFromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiCo {
  double? v;

  AirModelIaqiCo();

  factory AirModelIaqiCo.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiCoFromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiCoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiH {
  double? v;

  AirModelIaqiH();

  factory AirModelIaqiH.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiHFromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiHToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiNo2 {
  double? v;

  AirModelIaqiNo2();

  factory AirModelIaqiNo2.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiNo2FromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiNo2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiO3 {
  double? v;

  AirModelIaqiO3();

  factory AirModelIaqiO3.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiO3FromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiO3ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiP {
  int? v;

  AirModelIaqiP();

  factory AirModelIaqiP.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiPFromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiPToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiPm10 {
  int? v;

  AirModelIaqiPm10();

  factory AirModelIaqiPm10.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiPm10FromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiPm10ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiPm25 {
  int? v;

  AirModelIaqiPm25();

  factory AirModelIaqiPm25.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiPm25FromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiPm25ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiSo2 {
  double? v;

  AirModelIaqiSo2();

  factory AirModelIaqiSo2.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiSo2FromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiSo2ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiT {
  double? v;

  AirModelIaqiT();

  factory AirModelIaqiT.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiTFromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiTToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelIaqiW {
  double? v;

  AirModelIaqiW();

  factory AirModelIaqiW.fromJson(Map<String, dynamic> json) =>
      $AirModelIaqiWFromJson(json);

  Map<String, dynamic> toJson() => $AirModelIaqiWToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelTime {
  String? s;
  String? tz;
  int? v;
  String? iso;

  AirModelTime();

  factory AirModelTime.fromJson(Map<String, dynamic> json) =>
      $AirModelTimeFromJson(json);

  Map<String, dynamic> toJson() => $AirModelTimeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelForecast {
  AirModelForecastDaily? daily;

  AirModelForecast();

  factory AirModelForecast.fromJson(Map<String, dynamic> json) =>
      $AirModelForecastFromJson(json);

  Map<String, dynamic> toJson() => $AirModelForecastToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelForecastDaily {
  List<AirModelForecastDailyO3>? o3;
  List<AirModelForecastDailyPm10>? pm10;
  List<AirModelForecastDailyPm25>? pm25;
  List<AirModelForecastDailyUvi>? uvi;

  AirModelForecastDaily();

  factory AirModelForecastDaily.fromJson(Map<String, dynamic> json) =>
      $AirModelForecastDailyFromJson(json);

  Map<String, dynamic> toJson() => $AirModelForecastDailyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelForecastDailyO3 {
  int? avg;
  String? day;
  int? max;
  int? min;

  AirModelForecastDailyO3();

  factory AirModelForecastDailyO3.fromJson(Map<String, dynamic> json) =>
      $AirModelForecastDailyO3FromJson(json);

  Map<String, dynamic> toJson() => $AirModelForecastDailyO3ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelForecastDailyPm10 {
  int? avg;
  String? day;
  int? max;
  int? min;

  AirModelForecastDailyPm10();

  factory AirModelForecastDailyPm10.fromJson(Map<String, dynamic> json) =>
      $AirModelForecastDailyPm10FromJson(json);

  Map<String, dynamic> toJson() => $AirModelForecastDailyPm10ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelForecastDailyPm25 {
  int? avg;
  String? day;
  int? max;
  int? min;

  AirModelForecastDailyPm25();

  factory AirModelForecastDailyPm25.fromJson(Map<String, dynamic> json) =>
      $AirModelForecastDailyPm25FromJson(json);

  Map<String, dynamic> toJson() => $AirModelForecastDailyPm25ToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelForecastDailyUvi {
  int? avg;
  String? day;
  int? max;
  int? min;

  AirModelForecastDailyUvi();

  factory AirModelForecastDailyUvi.fromJson(Map<String, dynamic> json) =>
      $AirModelForecastDailyUviFromJson(json);

  Map<String, dynamic> toJson() => $AirModelForecastDailyUviToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AirModelDebug {
  String? sync;

  AirModelDebug();

  factory AirModelDebug.fromJson(Map<String, dynamic> json) =>
      $AirModelDebugFromJson(json);

  Map<String, dynamic> toJson() => $AirModelDebugToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
