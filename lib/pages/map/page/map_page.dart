import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:air_puff/mvp/base_page.dart';
import 'package:air_puff/mvp/power_presenter.dart';
import 'package:air_puff/pages/map/iviews/map_iviews.dart';
import 'package:air_puff/pages/map/presenter/map_presenter.dart';
import 'package:air_puff/pages/map/provider/map_provider.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<MapPage>,
        BasePageMixin<MapPage, PowerPresenter<dynamic>>
    implements MapPageIMvpView {
  LatLng? currentPosition;
  late GoogleMapController _mapController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      /// 重新检查权限
      await _getCurrentLocation();
      getMapData();
    });
  }

  BitmapDescriptor? customIcon;

  Future<void> getMapData() async {
    await _mapPresenter
        .getCityAirQualityData(currentPosition?.latitude ?? 51.5074,
            currentPosition?.longitude ?? -0.1278)
        .then((value) async {
      customIcon = await _buildMarkerIcon(provider.air.toString());
    });
    setState(() {});
  }


  late MapPagePresenter _mapPresenter;

  @override
  PowerPresenter<dynamic> createPresenter() {
    final PowerPresenter<dynamic> powerPresenter =
        PowerPresenter<dynamic>(this);
    _mapPresenter = MapPagePresenter();
    powerPresenter.requestPresenter([_mapPresenter]);
    return powerPresenter;
  }

  @override
  MapPageProvider provider = MapPageProvider();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<MapPageProvider>(
        create: (_) => provider,
        child: Consumer<MapPageProvider>(builder: (_, provider, __) {
          return Scaffold(
            appBar: AppBar(
              title: const Align(
                child: Text(
                  'Map Page',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              backgroundColor: Colors.blue[200],
            ),
            body: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              onTap: (position) {
                currentPosition = position;
                getMapData();
              },
              initialCameraPosition: CameraPosition(
                /// 取当前的位置，如果取不到取伦敦的位置
                target: currentPosition ?? const LatLng(51.5074, -0.1278),
                zoom: 10,
              ),
              myLocationButtonEnabled: true,
              markers: {
                Marker(
                  markerId: MarkerId(currentPosition.toString()),
                  position: LatLng(currentPosition?.latitude ?? 51.5074,
                      currentPosition?.longitude ?? -0.1278),
                  icon: customIcon ?? BitmapDescriptor.defaultMarker,
                ),
              },
            ),
          );
        }));
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
    // 获取当前位置
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = LatLng(position.latitude, position.longitude);
      _mapController.animateCamera(CameraUpdate.newLatLng(currentPosition!));
    });
  }

  @override
  bool get wantKeepAlive => true;

  Future<BitmapDescriptor> _buildMarkerIcon(String text) async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);

    const double width = 80.0;
    const double height = 80.0;

    // 绘制矩形背景
    final Paint bgPaint = Paint()..color = Colors.blue;
    const Rect bgRect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(bgRect, bgPaint);

    // 绘制文本
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: width);

    textPainter.paint(
      canvas,
      Offset(
          (width - textPainter.width) / 2, (height - textPainter.height) / 2),
    );

    // 将绘制内容转换为图像
    final ui.Picture picture = recorder.endRecording();
    final ui.Image image = await picture.toImage(width.toInt(), height.toInt());

    // 将图像转换为字节数据
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List byteList = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(byteList);
  }
}
