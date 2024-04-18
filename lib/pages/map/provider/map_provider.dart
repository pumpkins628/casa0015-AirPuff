import 'package:flutter/cupertino.dart';
import 'package:air_puff/pages/map/model/point_entity.dart';

class MapPageProvider extends ChangeNotifier {
  int air = 0;

  void setPointEntity(PointEntity model) {
    air = model.data?.current?.pollution?.aqicn ?? 0;
  }
}
