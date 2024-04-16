import 'package:shengyu_weather_forecast/mvp/mvps.dart';
import 'package:shengyu_weather_forecast/pages/map/provider/forecast_chart_provider.dart';

abstract class ForecastChartIMvpView implements IMvpView {
  ForecastChartProvider get provider;
}
