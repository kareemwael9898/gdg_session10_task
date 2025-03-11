import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:gdg_session_10/views/home_view.dart';

void main() {
  runApp( DevicePreview(builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

