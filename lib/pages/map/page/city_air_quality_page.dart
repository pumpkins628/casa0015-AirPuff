import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shengyu_weather_forecast/mvp/base_page.dart';
import 'package:shengyu_weather_forecast/mvp/power_presenter.dart';
import 'package:shengyu_weather_forecast/pages/map/iviews/one_city_ivews.dart';
import 'package:shengyu_weather_forecast/pages/map/presenter/one_city_presenter.dart';
import 'package:shengyu_weather_forecast/pages/map/provider/one_city_provider.dart';

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
              backgroundColor: Colors.purple[100],
            ),
            body: EasyRefresh(
              onRefresh: () {
                getCityAirQualityData();
              },
              child: SingleChildScrollView(
                child: Padding(
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

                          Column(
                            children: [
                              const Text(
                                'aqi:',
                                style:
                                TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                (provider.airModel?.aqi ?? 0).toString(),
                                style: const TextStyle(fontSize: 50),
                              ),
                              const Text(
                                'Current City:',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(provider.airModel?.city?.name ?? ''),
                              const Text(
                                'Last Monitoring Time:',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(provider.airModel?.time?.s ?? '')
                            ],
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
                                        (provider.airModel?.iaqi?.pm25?.v ?? 0)
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
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16, height: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
      return "空气质量被认为是满意的，污染物对健康的影响很小。\n出行建议：可以正常进行户外活动，享受室外运动。";
    } else if (aqi >= 51 && aqi <= 100) {
      return "空气质量可接受；对某些污染物较为敏感的人群可能会产生轻微的健康影响，但对公众健康整体影响不大。\n出行建议：大多数人可以正常进行户外活动。敏感人群应减少长时间的户外劳动和运动。";
    } else if (aqi >= 101 && aqi <= 150) {
      return "敏感人群可能会出现健康问题，但对公众整体健康影响较小。\n出行建议：儿童、老年人以及有心脏病或呼吸系统疾病的人应减少长时间的或高强度的户外运动，一般人群减少户外运动。";
    } else if (aqi >= 151 && aqi <= 200) {
      return "每个人都可能开始感受到健康影响，敏感人群的健康影响更加显著。\n出行建议：儿童、老年人和心脏病患者或肺病患者应避免长时间的或高强度的户外运动，一般人群应尽量减少户外运动。";
    } else if (aqi >= 201 && aqi <= 300) {
      return "健康警告情况：所有人都可能受到更严重的健康影响。\n出行建议：儿童、老年人和病人应保持室内，避免体力活动，一般人群应避免户外活动。";
    } else if (aqi >= 301 && aqi <= 500) {
      return "健康警报：整个人群都可能受到严重的健康影响。\n出行建议：所有人群应保持在室内，关闭门窗，减少体力活动，必要时使用空气净化器。";
    } else {
      return "数据错误";
    }
  }

  @override
  bool get wantKeepAlive => true;
}
