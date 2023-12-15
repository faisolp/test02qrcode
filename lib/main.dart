import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test02qrcode/view/ScanBarcode.dart';

import 'package:test02qrcode/view/ScanQRCode2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan QRCode Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ScanQRCode(title: 'Scan QRCode Demo'),
      //home:  ScanBarcode(),
    );
  }
}


