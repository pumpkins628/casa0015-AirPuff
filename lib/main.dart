import 'dart:async';
import 'package:air_puff/pages/map/page/startup_page.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:air_puff/pages/routers/routers.dart';
import 'package:air_puff/pages/tabber.dart';
import 'package:sp_util/sp_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SpUtil.getInstance();
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Routes.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom,
      child: MaterialApp(
        title: '',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          fontFamily: 'Roboto',
          useMaterial3: true,
        ),
        navigatorKey: MyApp.navigatorKey,
        onGenerateRoute: Routes.router.generator,
        home: const DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontSize: 14),
          child: StartupPage(),
        ),
      ),
    );
  }
}
