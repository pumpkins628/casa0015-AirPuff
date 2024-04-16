import 'package:easy_refresh/easy_refresh.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shengyu_weather_forecast/mvp/base_page.dart';
import 'package:shengyu_weather_forecast/mvp/power_presenter.dart';
import 'package:shengyu_weather_forecast/pages/map/iviews/forecast_chart_iviews.dart';
import 'package:shengyu_weather_forecast/pages/map/presenter/forecast_chart_presenter.dart';
import 'package:shengyu_weather_forecast/pages/map/provider/forecast_chart_provider.dart';

class ForecastChartPage extends StatefulWidget {
  const ForecastChartPage({Key? key}) : super(key: key);

  @override
  State<ForecastChartPage> createState() => _ForecastChartPageState();
}

class _ForecastChartPageState extends State<ForecastChartPage>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<ForecastChartPage>,
        BasePageMixin<ForecastChartPage, PowerPresenter<dynamic>>
    implements ForecastChartIMvpView {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getDataFromCache();
    });
  }

  Future<void> getForecastChartData() async {
    _forecastChartPresenter
        .getCityAirQualityData(provider.airModel?.city?.name ?? 'London');
  }

  late ForecastChartPresenter _forecastChartPresenter;

  @override
  PowerPresenter<dynamic> createPresenter() {
    final PowerPresenter<dynamic> powerPresenter =
        PowerPresenter<dynamic>(this);
    _forecastChartPresenter = ForecastChartPresenter();
    powerPresenter.requestPresenter([_forecastChartPresenter]);
    return powerPresenter;
  }

  @override
  ForecastChartProvider provider = ForecastChartProvider();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<ForecastChartProvider>(
        create: (_) => provider,
        child: Consumer<ForecastChartProvider>(builder: (_, provider, __) {
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
                getForecastChartData();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: provider.airModel != null
                      ? Column(
                          /// 上半部分展示
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius: BorderRadius.circular(10), // 圆角半径
                              ),
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: AspectRatio(
                                aspectRatio: 1.23,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 37,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          children: [
                                            const Text('O3'),
                                            const SizedBox(height: 4),
                                            Container(
                                              width: 40,
                                              height: 2,
                                              color: Colors.green,
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          children: [
                                            const Text('pm10'),
                                            const SizedBox(height: 4),
                                            Container(
                                              width: 40,
                                              height: 2,
                                              color: Colors.pink,
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          children: [
                                            const Text('pm25'),
                                            const SizedBox(height: 4),
                                            Container(
                                              width: 40,
                                              height: 2,
                                              color: Colors.blue,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Align(
                                        child: Text(
                                      'Changes in the indices',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 37,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16, left: 6),
                                        child: _LineChart(
                                          provider.bottomList,
                                          provider.o3MaxList,
                                          provider.pm25MaxList,
                                          provider.pm10MaxList,
                                          null,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[300],
                                borderRadius: BorderRadius.circular(10), // 圆角半径
                              ),
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: AspectRatio(
                                aspectRatio: 1.23,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Align(
                                        child: Text(
                                      'Forecast aqi index',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16, left: 6),
                                        child: _LineChart(
                                          provider.bottomList,
                                          provider.o3MaxList,
                                          provider.pm25MaxList,
                                          provider.pm10MaxList,
                                          provider.aqiList,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              ),
            ),
          );
        }));
  }

  @override
  bool get wantKeepAlive => false;
}

class _LineChart extends StatelessWidget {
  const _LineChart(this.bottomTitleList, this.o3MaxList, this.pm25MaxList,
      this.pm10MaxList, this.aqiList);

  final List<String> bottomTitleList;
  final List<int> o3MaxList;
  final List<int> pm25MaxList;
  final List<int> pm10MaxList;
  final List<int>? aqiList;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: aqiList == null ? lineBarsData1 : lineBarsData2,
        minX: 0,
        maxX: 14,
        maxY: 180,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  List<LineChartBarData> get lineBarsData2 => [
        lineChartBarData1_4,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = value.toString();
    switch (value.toInt()) {
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      case 120:
        text = '120';
        break;
      case 140:
        text = '140';
        break;
      case 160:
        text = '160';
        break;
      case 180:
        text = '180';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 25,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text(bottomTitleList[0], style: style);
        break;
      case 3:
        text = Text(bottomTitleList[1], style: style);
        break;
      case 5:
        text = Text(bottomTitleList[2], style: style);
      case 7:
        text = Text(bottomTitleList[3], style: style);
      case 9:
        text = Text(bottomTitleList[4], style: style);
      case 11:
        text = Text(bottomTitleList[5], style: style);
      case 13:
        text = Text(bottomTitleList[6], style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.purple.withOpacity(0.2), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(1, o3MaxList[0].toDouble()),
          FlSpot(3, o3MaxList[1].toDouble()),
          FlSpot(5, o3MaxList[2].toDouble()),
          FlSpot(7, o3MaxList[3].toDouble()),
          FlSpot(9, o3MaxList[4].toDouble()),
          FlSpot(11, o3MaxList[5].toDouble()),
          FlSpot(13, o3MaxList[6].toDouble()),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: Colors.pink,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
          color: Colors.pink.withOpacity(0),
        ),
        spots: [
          FlSpot(1, pm10MaxList[0].toDouble()),
          FlSpot(3, pm10MaxList[1].toDouble()),
          FlSpot(5, pm10MaxList[2].toDouble()),
          FlSpot(7, pm10MaxList[3].toDouble()),
          FlSpot(9, pm10MaxList[4].toDouble()),
          FlSpot(11, pm10MaxList[5].toDouble()),
          FlSpot(13, pm10MaxList[6].toDouble()),
        ],
      );

  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: Colors.cyan,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: [
          FlSpot(1, pm25MaxList[0].toDouble()),
          FlSpot(3, pm25MaxList[1].toDouble()),
          FlSpot(5, pm25MaxList[2].toDouble()),
          FlSpot(7, pm25MaxList[3].toDouble()),
          FlSpot(9, pm25MaxList[4].toDouble()),
          FlSpot(11, pm25MaxList[5].toDouble()),
          FlSpot(13, pm25MaxList[6].toDouble()),
        ],
      );

  LineChartBarData get lineChartBarData1_4 => LineChartBarData(
        isCurved: true,
        color: Colors.blue,
        barWidth: 2,
        curveSmoothness: 0,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.blue.withOpacity(0.2),
        ),
        spots: aqiList != null
            ? [
                FlSpot(1, aqiList![0].toDouble()),
                FlSpot(3, aqiList![1].toDouble()),
                FlSpot(5, aqiList![2].toDouble()),
                FlSpot(7, aqiList![3].toDouble()),
                FlSpot(9, aqiList![4].toDouble()),
                FlSpot(11, aqiList![5].toDouble()),
                FlSpot(13, aqiList![6].toDouble()),
              ]
            : [],
      );
}
