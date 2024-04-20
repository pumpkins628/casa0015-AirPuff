import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:air_puff/mvp/base_page.dart';
import 'package:air_puff/mvp/power_presenter.dart';
import 'package:air_puff/pages/map/iviews/one_city_ivews.dart';
import 'package:air_puff/pages/map/presenter/one_city_presenter.dart';
import 'package:air_puff/pages/map/provider/one_city_provider.dart';

class CityAirQualityPage extends StatefulWidget {
  const CityAirQualityPage({Key? key}) : super(key: key);

  @override
  State<CityAirQualityPage> createState() => _CityAirQualityPageState();
}

class _CityAirQualityPageState extends State<CityAirQualityPage>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<CityAirQualityPage>,
        BasePageMixin<CityAirQualityPage, PowerPresenter<dynamic>>
    implements OneCityIMvpView {
  @override
  void initState() {
    super.initState();
    provider.cityNameController.text = 'London';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCityAirQualityData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    provider.cityNameController.dispose();
  }

  Future<void> getCityAirQualityData() async {
    _oneCityPresenter.getCityAirQualityData(provider.cityNameController.text);
  }

  late OneCityPresenter _oneCityPresenter;

  @override
  PowerPresenter<dynamic> createPresenter() {
    final PowerPresenter<dynamic> powerPresenter =
        PowerPresenter<dynamic>(this);
    _oneCityPresenter = OneCityPresenter();
    powerPresenter.requestPresenter([_oneCityPresenter]);
    return powerPresenter;
  }

  @override
  OneCityProvider provider = OneCityProvider();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<OneCityProvider>(
        create: (_) => provider,
        child: Consumer<OneCityProvider>(builder: (_, provider, __) {
          return Scaffold(
            appBar: AppBar(
              title: const Align(
                child: Text(
                  'AirPuff',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              backgroundColor: Colors.blue[200],
            ),
            body: CustomMaterialIndicator(
              onRefresh: getCityAirQualityData,
              indicatorBuilder:
                  (BuildContext context, IndicatorController controller) {
                return const Icon(
                  Icons.ac_unit,
                  color: Colors.blue,
                  size: 30,
                );
              },
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      /// 上半部分展示
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextField(
                                    controller: provider.cityNameController,
                                    onSubmitted: (value) {
                                      getCityAirQualityData();
                                    },
                                    decoration: const InputDecoration(
                                        icon: Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Icon(Icons.search,
                                              color: Colors.grey),
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.all(3),
                                        hintText: 'Please enter city name',
                                        counterText: ""),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              SizedBox(
                                  width: 100,
                                  height: 30,
                                  child: FilledButton(
                                    onPressed: () {
                                      getCityAirQualityData();
                                    },
                                    child: const Align(
                                      child: Text('search'),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: Colors.blue[50],
                              child: SizedBox(
                                width: 120,
                                height: 120,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      (provider.airModel?.aqi ?? 0).toString(),
                                      style: const TextStyle(fontSize: 50),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      airQualityIndex(
                                          'O3',
                                          (provider.airModel?.iaqi?.o3?.v ?? 0)
                                              .toString()),
                                      const SizedBox(height: 10),
                                      airQualityIndex(
                                          'PM2.5',
                                          (provider.airModel?.iaqi?.pm25?.v ??
                                                  0)
                                              .toString()),
                                      const SizedBox(height: 10),
                                      airQualityIndex(
                                          'SO2',
                                          (provider.airModel?.iaqi?.so2?.v ?? 0)
                                              .toString()),
                                      const SizedBox(height: 10),
                                      airQualityIndex(
                                          'NO2',
                                          (provider.airModel?.iaqi?.no2?.v ?? 0)
                                              .toString()),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Align(
                          child: Text('Suggestions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          children: [
                            Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  getSuggestions((provider.airModel?.aqi ?? 0)),
                                  maxLines: 15,
                                  overflow: TextOverflow.ellipsis,
                                  // textAlign: TextAlign.center,
                                  style:
                                      const TextStyle(fontSize: 16, height: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  /// 每一行空气质量的样式
  Widget airQualityIndex(String name, String count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 70, child: Text(name)),
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightBlue[400], // 设置圆圈的颜色
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 70,
          child: Text(
            count,
          ),
        )
      ],
    );
  }

  String getSuggestions(int aqi) {
    if (aqi >= 0 && aqi <= 50) {
      return "Good:\n  The air quality is deemed excellent. This level of air purity means there is minimal or no risk associated with air pollution.\nOutdoor Activity Guidance:\n   It is a perfect day for enjoying the outdoors. All outdoor activities like jogging, cycling, and picnics can be enjoyed without any concerns for air quality.";
    } else if (aqi >= 51 && aqi <= 100) {
      return "Moderate:\n  Air quality is acceptable; however, for some pollutants there may be a moderate health concern for a very small number of people who are unusually sensitive to air pollution.\nOutdoor Activity Guidance:\n   Most people can participate in outdoor activities. Those who are sensitive, such as people with certain medical conditions, should consider limiting intensive outdoor exercises and prolonged exposure to outdoor air.";
    } else if (aqi >= 101 && aqi <= 150) {
      return "Unhealthy for Sensitive Groups:\n  Sensitive individuals may experience more significant effects from air pollution, which can lead to health issues but the general public is less likely to be affected.\nOutdoor Activity Guidance:\n   People at risk such as children, the elderly, and those with cardiovascular or respiratory conditions should limit outdoor exertion. General population should think about reducing outdoor physical activities to lower their exposure to air pollutants.";
    } else if (aqi >= 151 && aqi <= 200) {
      return "Unhealthy:\n  The air quality is poor and everyone may start to experience health effects; members of sensitive groups may find these effects more pronounced.\nOutdoor Activity Guidance:\n   Vulnerable groups including children and the elderly, along with people suffering from heart and lung diseases, should avoid strenuous activities and outdoor sports. Others should scale back intense outdoor activities.";
    } else if (aqi >= 201 && aqi <= 300) {
      return "Very Unhealthy:\n  At this level, the air quality is alarming, and everyone may be affected more severely by the pollution.\nOutdoor Activity Guidance:\n   It is advisable for sensitive populations to stay indoors and avoid all physical activity. People who are not sensitive should also stay indoors and curtail all outdoor activities as much as possible.";
    } else if (aqi >= 301 && aqi <= 500) {
      return "Hazardous:\n  This represents emergency conditions where the air quality is dangerously poor. The health risk from air pollution is critical for everyone.\nOutdoor Activity Guidance:\n   All individuals, regardless of health status, should remain indoors, keep windows and doors closed, and refrain from physical exertion. Using air purifiers can help to reduce indoor air pollution during these hazardous conditions.";
    } else {
      return "data error!";
    }
  }

  @override
  bool get wantKeepAlive => true;
}
