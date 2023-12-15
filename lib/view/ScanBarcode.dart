import 'package:flutter/material.dart';

class ScanBarcode extends StatefulWidget {
  @override
  _ScanBarcodeState createState() => _ScanBarcodeState();
}

class _ScanBarcodeState extends State<ScanBarcode> {
  TextEditingController _textFieldController = TextEditingController();
  List<String> _dataList = [];
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Text Input'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(
                labelText: 'ป้อนข้อความ',
              ),
              autofocus: true,
              focusNode: myFocusNode,
              onSubmitted: (text) {
                _dataList.insert(0, text);
                _textFieldController.clear();
                myFocusNode.requestFocus();

                setState(() {});
              },
            ),
            Column(
              children: _dataList
                  .map((text) => ListTile(
                        title: Text(text),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _dataList.remove(text);
                            setState(() {});
                          },
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
