import 'package:air_puff/mvp/mvps.dart';
import 'package:air_puff/pages/map/provider/one_city_provider.dart';

abstract class OneCityIMvpView implements IMvpView {
  OneCityProvider get provider;
}
