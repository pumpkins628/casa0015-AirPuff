import 'dart:convert';

import 'package:shengyu_weather_forecast/mvp/base_page_presenter.dart';
import 'package:shengyu_weather_forecast/pages/map/iviews/forecast_chart_iviews.dart';
import 'package:http/http.dart' as http;
import 'package:shengyu_weather_forecast/pages/map/model/air_quality_entity.dart';

class ForecastChartPresenter extends BasePagePresenter<ForecastChartIMvpView> {

  // 获取某个城市的空气质量
  Future<dynamic> getCityAirQualityData(
      String cityName,
      ) async {
    Uri u = Uri.http('api.waqi.info', '/feed/$cityName', {
      "token": "a86e6a2502c20979c108bbd3b957fc06cced853b",
    });
    final  response = await http.get(u);
    if (response.statusCode == 200) {
      AirQualityEntity model = AirQualityEntity.fromJson(json.decode(response.body));
      view.provider.refreshData(model);
    } else {
      throw Exception(
          'Failed to fetch access token: ${response.reasonPhrase}');
    }
  }
}
