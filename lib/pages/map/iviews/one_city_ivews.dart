import 'package:shengyu_weather_forecast/mvp/mvps.dart';
import 'package:shengyu_weather_forecast/pages/map/provider/one_city_provider.dart';

abstract class OneCityIMvpView implements IMvpView {
  OneCityProvider get provider;
}
