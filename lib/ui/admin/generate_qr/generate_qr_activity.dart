import 'package:absen_qrcode/ui/admin/generate_qr/list_generate_qr_activity.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GenerateQrActivity extends StatefulWidget {
  const GenerateQrActivity({Key? key}) : super(key: key);

  @override
  State<GenerateQrActivity> createState() => GenerateQrActivityState();
}

class GenerateQrActivityState extends State<GenerateQrActivity> {
  String data = "";
  final CollectionReference _items =
      FirebaseFirestore.instance.collection("qr");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Generate Qr",
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListGenerateQrActivity(),
                  ));
            },
          ),
        ],
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
            onPressed: () async {
              upsertMatakuliahFirebase();

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListGenerateQrActivity(),
                  ));
            },
          ),
        ],
      ),
    );
  }

  Future<void> upsertMatakuliahFirebase() async {
    //insert
    await _items.add({"codeQr": data});
  }
}
