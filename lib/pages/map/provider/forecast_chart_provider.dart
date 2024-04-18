import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:air_puff/pages/map/model/air_model_entity.dart';
import 'package:air_puff/pages/map/model/air_quality_entity.dart';
import 'package:sp_util/sp_util.dart';

class ForecastChartProvider extends ChangeNotifier {
  AirModelEntity? airModel;

  List<String> bottomList = [];

  List<int> o3MaxList = [];

  List<int> pm25MaxList = [];

  List<int> pm10MaxList = [];

  List<int> aqiList = [];

  void refreshData(AirQualityEntity model) {
    airModel = model.data;
    getChartData(airModel?.forecast?.daily);
    notifyListeners();
  }

  void getDataFromCache() {
    airModel = AirModelEntity.fromJson(
        SpUtil.getObject('airModel') as Map<String, dynamic>);
    getChartData(airModel?.forecast?.daily);
    notifyListeners();
  }

  void getChartData(AirModelForecastDaily? model) {
    if (model != null) {
      getBottomList(model.o3);
      getPM10List(model.pm10);
      getPM25List(model.pm25);
      getAQIList();
    }
  }

  void getBottomList(List<AirModelForecastDailyO3>? modelList) {
    if (modelList != null && modelList.isNotEmpty) {
      bottomList.clear();
      o3MaxList.clear();
      for (final model in modelList) {
        o3MaxList.add(model.max ?? 0);
        bottomList.add(model.day ?? '');
      }

      for (int i = 0; i < bottomList.length; i++) {
        List<String> tempModel = bottomList[i].split('-').toList();
        tempModel.removeAt(0);
        tempModel[0] = int.parse(tempModel[0]).toString();
        tempModel[1] = int.parse(tempModel[1]).toString();
        bottomList[i] = tempModel.join('.');
      }
    }
  }

  void getPM25List(List<AirModelForecastDailyPm25>? modelList) {
    if (modelList != null && modelList.isNotEmpty) {
      pm25MaxList.clear();
      for (final model in modelList) {
        pm25MaxList.add(model.max ?? 0);
      }
    }
  }

  void getPM10List(List<AirModelForecastDailyPm10>? modelList) {
    if (modelList != null && modelList.isNotEmpty) {
      pm10MaxList.clear();
      for (final model in modelList) {
        pm10MaxList.add(model.max ?? 0);
      }
    }
  }

  void getAQIList() {
    aqiList.clear();
    int listMaxLengthMin =
        min(min(pm10MaxList.length, pm25MaxList.length), o3MaxList.length);
    for (int i = 0; i < listMaxLengthMin; i++) {
      aqiList.add(max(max(pm10MaxList[i], pm25MaxList[i]), o3MaxList[i]));
    }
  }
}
