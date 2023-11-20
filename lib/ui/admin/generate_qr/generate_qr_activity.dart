import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrActivity extends StatefulWidget {
  const GenerateQrActivity({Key? key}) : super(key: key);

  @override
  State<GenerateQrActivity> createState() => GenerateQrActivityState();
}

class GenerateQrActivityState extends State<GenerateQrActivity> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Generate Qr",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImageView(
              data: data,
              backgroundColor: Colors.white,
              version: QrVersions.auto,
              size: 300.0,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: 300.0,
            child: TextField(
              //we will generate a new qr code when the input value change
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: "Type the Data",
                filled: true,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
            child: Text("Generate QR Code"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
