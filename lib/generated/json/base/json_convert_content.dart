// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:air_puff/pages/map/model/air_model_entity.dart';
import 'package:air_puff/pages/map/model/air_quality_entity.dart';
import 'package:air_puff/pages/map/model/point_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);
extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(value as Map<String, dynamic>) as T;
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<AirModelEntity>[] is M) {
      return data.map<AirModelEntity>((Map<String, dynamic> e) =>
          AirModelEntity.fromJson(e)).toList() as M;
    }
    if (<AirModelAttributions>[] is M) {
      return data.map<AirModelAttributions>((Map<String, dynamic> e) =>
          AirModelAttributions.fromJson(e)).toList() as M;
    }
    if (<AirModelCity>[] is M) {
      return data.map<AirModelCity>((Map<String, dynamic> e) =>
          AirModelCity.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqi>[] is M) {
      return data.map<AirModelIaqi>((Map<String, dynamic> e) =>
          AirModelIaqi.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiCo>[] is M) {
      return data.map<AirModelIaqiCo>((Map<String, dynamic> e) =>
          AirModelIaqiCo.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiH>[] is M) {
      return data.map<AirModelIaqiH>((Map<String, dynamic> e) =>
          AirModelIaqiH.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiNo2>[] is M) {
      return data.map<AirModelIaqiNo2>((Map<String, dynamic> e) =>
          AirModelIaqiNo2.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiO3>[] is M) {
      return data.map<AirModelIaqiO3>((Map<String, dynamic> e) =>
          AirModelIaqiO3.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiP>[] is M) {
      return data.map<AirModelIaqiP>((Map<String, dynamic> e) =>
          AirModelIaqiP.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiPm10>[] is M) {
      return data.map<AirModelIaqiPm10>((Map<String, dynamic> e) =>
          AirModelIaqiPm10.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiPm25>[] is M) {
      return data.map<AirModelIaqiPm25>((Map<String, dynamic> e) =>
          AirModelIaqiPm25.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiSo2>[] is M) {
      return data.map<AirModelIaqiSo2>((Map<String, dynamic> e) =>
          AirModelIaqiSo2.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiT>[] is M) {
      return data.map<AirModelIaqiT>((Map<String, dynamic> e) =>
          AirModelIaqiT.fromJson(e)).toList() as M;
    }
    if (<AirModelIaqiW>[] is M) {
      return data.map<AirModelIaqiW>((Map<String, dynamic> e) =>
          AirModelIaqiW.fromJson(e)).toList() as M;
    }
    if (<AirModelTime>[] is M) {
      return data.map<AirModelTime>((Map<String, dynamic> e) =>
          AirModelTime.fromJson(e)).toList() as M;
    }
    if (<AirModelForecast>[] is M) {
      return data.map<AirModelForecast>((Map<String, dynamic> e) =>
          AirModelForecast.fromJson(e)).toList() as M;
    }
    if (<AirModelForecastDaily>[] is M) {
      return data.map<AirModelForecastDaily>((Map<String, dynamic> e) =>
          AirModelForecastDaily.fromJson(e)).toList() as M;
    }
    if (<AirModelForecastDailyO3>[] is M) {
      return data.map<AirModelForecastDailyO3>((Map<String, dynamic> e) =>
          AirModelForecastDailyO3.fromJson(e)).toList() as M;
    }
    if (<AirModelForecastDailyPm10>[] is M) {
      return data.map<AirModelForecastDailyPm10>((Map<String, dynamic> e) =>
          AirModelForecastDailyPm10.fromJson(e)).toList() as M;
    }
    if (<AirModelForecastDailyPm25>[] is M) {
      return data.map<AirModelForecastDailyPm25>((Map<String, dynamic> e) =>
          AirModelForecastDailyPm25.fromJson(e)).toList() as M;
    }
    if (<AirModelForecastDailyUvi>[] is M) {
      return data.map<AirModelForecastDailyUvi>((Map<String, dynamic> e) =>
          AirModelForecastDailyUvi.fromJson(e)).toList() as M;
    }
    if (<AirModelDebug>[] is M) {
      return data.map<AirModelDebug>((Map<String, dynamic> e) =>
          AirModelDebug.fromJson(e)).toList() as M;
    }
    if (<AirQualityEntity>[] is M) {
      return data.map<AirQualityEntity>((Map<String, dynamic> e) =>
          AirQualityEntity.fromJson(e)).toList() as M;
    }
    if (<PointEntity>[] is M) {
      return data.map<PointEntity>((Map<String, dynamic> e) =>
          PointEntity.fromJson(e)).toList() as M;
    }
    if (<PointData>[] is M) {
      return data.map<PointData>((Map<String, dynamic> e) =>
          PointData.fromJson(e)).toList() as M;
    }
    if (<PointDataLocation>[] is M) {
      return data.map<PointDataLocation>((Map<String, dynamic> e) =>
          PointDataLocation.fromJson(e)).toList() as M;
    }
    if (<PointDataForecasts>[] is M) {
      return data.map<PointDataForecasts>((Map<String, dynamic> e) =>
          PointDataForecasts.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrent>[] is M) {
      return data.map<PointDataCurrent>((Map<String, dynamic> e) =>
          PointDataCurrent.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentWeather>[] is M) {
      return data.map<PointDataCurrentWeather>((Map<String, dynamic> e) =>
          PointDataCurrentWeather.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentPollution>[] is M) {
      return data.map<PointDataCurrentPollution>((Map<String, dynamic> e) =>
          PointDataCurrentPollution.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentPollutionP2>[] is M) {
      return data.map<PointDataCurrentPollutionP2>((Map<String, dynamic> e) =>
          PointDataCurrentPollutionP2.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentPollutionP1>[] is M) {
      return data.map<PointDataCurrentPollutionP1>((Map<String, dynamic> e) =>
          PointDataCurrentPollutionP1.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentPollutionN2>[] is M) {
      return data.map<PointDataCurrentPollutionN2>((Map<String, dynamic> e) =>
          PointDataCurrentPollutionN2.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentPollutionS2>[] is M) {
      return data.map<PointDataCurrentPollutionS2>((Map<String, dynamic> e) =>
          PointDataCurrentPollutionS2.fromJson(e)).toList() as M;
    }
    if (<PointDataCurrentPollutionCo>[] is M) {
      return data.map<PointDataCurrentPollutionCo>((Map<String, dynamic> e) =>
          PointDataCurrentPollutionCo.fromJson(e)).toList() as M;
    }
    if (<PointDataHistory>[] is M) {
      return data.map<PointDataHistory>((Map<String, dynamic> e) =>
          PointDataHistory.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryWeather>[] is M) {
      return data.map<PointDataHistoryWeather>((Map<String, dynamic> e) =>
          PointDataHistoryWeather.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryPollution>[] is M) {
      return data.map<PointDataHistoryPollution>((Map<String, dynamic> e) =>
          PointDataHistoryPollution.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryPollutionP2>[] is M) {
      return data.map<PointDataHistoryPollutionP2>((Map<String, dynamic> e) =>
          PointDataHistoryPollutionP2.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryPollutionP1>[] is M) {
      return data.map<PointDataHistoryPollutionP1>((Map<String, dynamic> e) =>
          PointDataHistoryPollutionP1.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryPollutionN2>[] is M) {
      return data.map<PointDataHistoryPollutionN2>((Map<String, dynamic> e) =>
          PointDataHistoryPollutionN2.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryPollutionS2>[] is M) {
      return data.map<PointDataHistoryPollutionS2>((Map<String, dynamic> e) =>
          PointDataHistoryPollutionS2.fromJson(e)).toList() as M;
    }
    if (<PointDataHistoryPollutionCo>[] is M) {
      return data.map<PointDataHistoryPollutionCo>((Map<String, dynamic> e) =>
          PointDataHistoryPollutionCo.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (AirModelEntity).toString(): AirModelEntity.fromJson,
    (AirModelAttributions).toString(): AirModelAttributions.fromJson,
    (AirModelCity).toString(): AirModelCity.fromJson,
    (AirModelIaqi).toString(): AirModelIaqi.fromJson,
    (AirModelIaqiCo).toString(): AirModelIaqiCo.fromJson,
    (AirModelIaqiH).toString(): AirModelIaqiH.fromJson,
    (AirModelIaqiNo2).toString(): AirModelIaqiNo2.fromJson,
    (AirModelIaqiO3).toString(): AirModelIaqiO3.fromJson,
    (AirModelIaqiP).toString(): AirModelIaqiP.fromJson,
    (AirModelIaqiPm10).toString(): AirModelIaqiPm10.fromJson,
    (AirModelIaqiPm25).toString(): AirModelIaqiPm25.fromJson,
    (AirModelIaqiSo2).toString(): AirModelIaqiSo2.fromJson,
    (AirModelIaqiT).toString(): AirModelIaqiT.fromJson,
    (AirModelIaqiW).toString(): AirModelIaqiW.fromJson,
    (AirModelTime).toString(): AirModelTime.fromJson,
    (AirModelForecast).toString(): AirModelForecast.fromJson,
    (AirModelForecastDaily).toString(): AirModelForecastDaily.fromJson,
    (AirModelForecastDailyO3).toString(): AirModelForecastDailyO3.fromJson,
    (AirModelForecastDailyPm10).toString(): AirModelForecastDailyPm10.fromJson,
    (AirModelForecastDailyPm25).toString(): AirModelForecastDailyPm25.fromJson,
    (AirModelForecastDailyUvi).toString(): AirModelForecastDailyUvi.fromJson,
    (AirModelDebug).toString(): AirModelDebug.fromJson,
    (AirQualityEntity).toString(): AirQualityEntity.fromJson,
    (PointEntity).toString(): PointEntity.fromJson,
    (PointData).toString(): PointData.fromJson,
    (PointDataLocation).toString(): PointDataLocation.fromJson,
    (PointDataForecasts).toString(): PointDataForecasts.fromJson,
    (PointDataCurrent).toString(): PointDataCurrent.fromJson,
    (PointDataCurrentWeather).toString(): PointDataCurrentWeather.fromJson,
    (PointDataCurrentPollution).toString(): PointDataCurrentPollution.fromJson,
    (PointDataCurrentPollutionP2).toString(): PointDataCurrentPollutionP2
        .fromJson,
    (PointDataCurrentPollutionP1).toString(): PointDataCurrentPollutionP1
        .fromJson,
    (PointDataCurrentPollutionN2).toString(): PointDataCurrentPollutionN2
        .fromJson,
    (PointDataCurrentPollutionS2).toString(): PointDataCurrentPollutionS2
        .fromJson,
    (PointDataCurrentPollutionCo).toString(): PointDataCurrentPollutionCo
        .fromJson,
    (PointDataHistory).toString(): PointDataHistory.fromJson,
    (PointDataHistoryWeather).toString(): PointDataHistoryWeather.fromJson,
    (PointDataHistoryPollution).toString(): PointDataHistoryPollution.fromJson,
    (PointDataHistoryPollutionP2).toString(): PointDataHistoryPollutionP2
        .fromJson,
    (PointDataHistoryPollutionP1).toString(): PointDataHistoryPollutionP1
        .fromJson,
    (PointDataHistoryPollutionN2).toString(): PointDataHistoryPollutionN2
        .fromJson,
    (PointDataHistoryPollutionS2).toString(): PointDataHistoryPollutionS2
        .fromJson,
    (PointDataHistoryPollutionCo).toString(): PointDataHistoryPollutionCo
        .fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}