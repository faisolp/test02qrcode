
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
//import 'package:flutter/cupertino.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';//
//import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key, required this.title});

  final String title;

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String scanData = "";
  List<String> listData = [];
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Center(child: 
        
        ListView(
          children: listData.map((item) => ListItem(item)).toList(),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: scanOnPressed,
        tooltip: 'scan',
        child: const Icon(Icons.qr_code),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  scanOnPressed() async {
    await Permission.camera.request();
    String cameraScanResult = await scanner.scan() ?? " ";
    setState(() {
      listData.insert(0, cameraScanResult);
      //scanData = cameraScanResult;
    });
    if (kDebugMode) {
      print(cameraScanResult);
    }
  }

  Widget ListItem(String item) {
    return Text(item);
  }
}
