import 'package:absen_qrcode/ui/main/home/main_screen_activity.dart';
import 'package:absen_qrcode/ui/main/landing_page_activity.dart';
import 'package:absen_qrcode/ui/main/scan/scan_screen.dart';
import 'package:absen_qrcode/ui/main/scan/scan_confirm_sukses_activity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScanSuksesActivity extends StatefulWidget {
  final String code;
  final Function() closeScreen;

  ScanSuksesActivity(
      {super.key, required this.closeScreen, required this.code});

  @override
  State<ScanSuksesActivity> createState() => _ScanSuksesActivityState();
}

class _ScanSuksesActivityState extends State<ScanSuksesActivity> {
  final CollectionReference _items =
      FirebaseFirestore.instance.collection("absen");

  @override
  void initState() {
    super.initState();
  }

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
            padding: const EdgeInsets.fromLTRB(12.0, 175.0, 12.0, 0),
            child: Column(
              children: [
                QrImageView(
                  data: widget.code,
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
                  "${widget.code}",
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
                    onPressed: () async {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => MyApp()));
                      upsertMatakuliahFirebase();

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => ScanConfirmSuksesActivity()),
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

  Future<void> upsertMatakuliahFirebase() async {
    //insert
    await _items.add({
      "keterangan": widget.code,
      "tanggalWaktu": "${getRealTime()}",
    });
  }

  String getRealTime() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }
}
