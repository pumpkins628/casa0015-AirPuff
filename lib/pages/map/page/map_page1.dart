import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage1 extends StatefulWidget {
  const MapPage1({super.key});

  @override
  _MapPage1State createState() => _MapPage1State();
}

class _MapPage1State extends State<MapPage1>
    with AutomaticKeepAliveClientMixin<MapPage1> {
  final String htmlContent = """
    <!DOCTYPE html>
    <html>
    <head>
      <style>
        #map {
          height: 100vh; /* 让地图占满整个屏幕高度 */
        }
      </style>
    </head>
    <body>
      <div id='map'></div>
      <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCB-lR46ZhYMLMY3G4WTC0xX4FnF4MzOlM"></script>
      <script>
        var map = new google.maps.Map(document.getElementById('map'), {
          center: new google.maps.LatLng(51.505, -0.09),
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          zoom: 11
        });
        var t = new Date().getTime();
        var waqiMapOverlay = new google.maps.ImageMapType({
          getTileUrl: function (coord, zoom) {
            return 'https://tiles.aqicn.org/tiles/usepa-aqi/' + zoom + '/' + coord.x + '/' + coord.y + '.png?token=a86e6a2502c20979c108bbd3b957fc06cced853b';
          },
          name: "Air Quality"
        });
        map.overlayMapTypes.insertAt(0, waqiMapOverlay);
      </script>
    </body>
    </html>
  """;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          child: Text(
            'Map Page',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        backgroundColor: Colors.purple[100],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            webViewController.loadUrl(Uri.dataFromString(
              htmlContent,
              mimeType: 'text/html',
              encoding: Encoding.getByName('utf-8'),
            ).toString());
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
