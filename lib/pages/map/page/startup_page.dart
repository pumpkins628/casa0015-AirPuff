// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:air_puff/pages/tabber.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  String _displayText = '';
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startAnimation() {
    const text = 'Protect your daily life~';
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_currentIndex < text.length) {
        setState(() {
          _displayText = text.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        _timer.cancel();

        _navigateToTaber();
      }
    });
  }

  Future<void> _navigateToTaber() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Taber()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 80,
              width: 80,
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _displayText.isNotEmpty ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Text(
                _displayText,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
