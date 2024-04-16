import 'package:flutter/cupertino.dart';
import 'package:shengyu_weather_forecast/pages/map/model/air_model_entity.dart';
import 'package:shengyu_weather_forecast/pages/map/model/air_quality_entity.dart';
import 'package:sp_util/sp_util.dart';

class OneCityProvider extends ChangeNotifier {
  AirModelEntity? airModel;

  TextEditingController cityNameController = TextEditingController();

  void setAirQualityEntity(AirQualityEntity model) {
    airModel = model.data;
    cityNameController.text = airModel?.city?.name ?? '';

    /// 将model写在缓存里
    if (airModel != null) {
      SpUtil.putObject('airModel', airModel!);
    }

    notifyListeners();
  }
}
