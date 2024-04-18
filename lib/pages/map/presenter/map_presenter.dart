import 'dart:convert';
import 'package:air_puff/mvp/base_page_presenter.dart';
import 'package:air_puff/pages/map/iviews/map_iviews.dart';
import 'package:http/http.dart' as http;
import 'package:air_puff/pages/map/model/point_entity.dart';

class MapPagePresenter extends BasePagePresenter<MapPageIMvpView> {
  // 坐标最近城市的空气质量
  Future<dynamic> getCityAirQualityData(
      double lat,
      double lon,
      ) async {
    Uri u = Uri.http('api.airvisual.com', '/v2/nearest_city', {
      "lat":lat.toString(),
      "lon":lon.toString(),
      "key": "ea0a79c3-6241-4df5-9afa-81d8602e565f",
    });
    final response = await http.get(u);
    if (response.statusCode == 200) {
      PointEntity model = PointEntity.fromJson(json.decode(response.body));
      view.provider.setPointEntity(model);
    } else {
      throw Exception(
          'Failed to fetch access token: ${response.reasonPhrase}');
    }
  }
}
