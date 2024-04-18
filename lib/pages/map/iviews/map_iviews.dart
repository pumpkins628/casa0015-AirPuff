import 'package:air_puff/mvp/mvps.dart';
import 'package:air_puff/pages/map/provider/map_provider.dart';

abstract class MapPageIMvpView implements IMvpView {
  MapPageProvider get provider;
}
