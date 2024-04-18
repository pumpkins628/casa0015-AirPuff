import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:air_puff/pages/map/page/city_air_quality_page.dart';
import 'package:air_puff/pages/map/page/forecast_chart_page.dart';
import 'package:air_puff/pages/map/page/map_page.dart';

class Taber extends StatefulWidget {
  const Taber({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaberState createState() => _TaberState();
}

class _TaberState extends State<Taber> {
  static const double _imageSize = 40;
  late List<Widget> _pageList;
  final PageController _pageController = PageController();
  late List<BottomNavigationBarItem>? _list;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    initData();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      /// Get Location
      await _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void initData() {
    _pageList = [
      const CityAirQualityPage(),
      const MapPage(),
      const ForecastChartPage(),
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    _list = List.generate(3, (index) {
      return BottomNavigationBarItem(
        icon: tabImages[index][0],
        activeIcon: tabImages[index][1],
        label: '',
      );
    });
    return _list!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: _buildBottomNavigationBarItem(),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          elevation: 5.0,
          iconSize: 21.0,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: const Color(0xFF4D4D4D),
          onTap: (index) {
            _pageController.jumpToPage(index);
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // Cannot move
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          children: _pageList,
        ));
  }

  static List<List<StatelessWidget>> tabImages = [
    [
      SvgPicture.asset(
        'assets/images/location2.svg',
        width: _imageSize,
      ),
      SvgPicture.asset(
        'assets/images/location1.svg',
        width: _imageSize,
      ),
    ],
    [
      SvgPicture.asset(
        'assets/images/map2.svg',
        width: _imageSize,
      ),
      SvgPicture.asset(
        'assets/images/map1.svg',
        width: _imageSize,
      ),
    ],
    [
      SvgPicture.asset(
        'assets/images/history2.svg',
        width: _imageSize,
      ),
      SvgPicture.asset(
        'assets/images/history1.svg',
        width: _imageSize,
      ),
    ],
  ];
}
