import 'package:air_puff/mvp/mvps.dart';
import 'package:air_puff/pages/map/provider/forecast_chart_provider.dart';

abstract class ForecastChartIMvpView implements IMvpView {
  ForecastChartProvider get provider;
}
