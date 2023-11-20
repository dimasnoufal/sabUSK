import 'package:absen_qrcode/ui/main/home/main_screen_activity.dart';
import 'package:absen_qrcode/ui/main/landing_page_activity.dart';
import 'package:absen_qrcode/ui/main/scan/scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanSuksesActivity extends StatelessWidget {
  final String code;
  final Function() closeScreen;

  const ScanSuksesActivity(
      {super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       closeScreen();
          //       Navigator.pop(context);
          //     },
          //     icon: Icon(
          //       Icons.arrow_back,
          //       color: Colors.blue,
          //     )),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Qr Scanner",
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                QrImageView(
                  data: code,
                  version: QrVersions.auto,
                  size: 150,
                ),
                Text(
                  "Scanned Result",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$code",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => MyApp()));
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    child: Text(
                      "Ok",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
