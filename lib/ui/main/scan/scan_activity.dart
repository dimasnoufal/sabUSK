import 'package:absen_qrcode/ui/main/scan/scan_sukses_activity.dart';
import 'package:flutter/material.dart';
// import 'package:absen_qrcode/ui/main/scan/scan_screen.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanActivity extends StatefulWidget {
  const ScanActivity({Key? key}) : super(key: key);

  @override
  State<ScanActivity> createState() => _ScanActivityState();
}

class _ScanActivityState extends State<ScanActivity> {
  bool isScanCompleted = false;

  void closeScreen() {
    isScanCompleted = false;
  }

  void initState() {
    super.initState();
    qrStart();
  }

  Future qrStart() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Cancel", true, ScanMode.QR);

    isScanCompleted = true;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ScanSuksesActivity(closeScreen: closeScreen, code: barcode),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      )),
      // home: ScanScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Qr Scanner',
    );
  }
}
