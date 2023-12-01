import 'package:absen_qrcode/ui/main/landing_page_activity.dart';
import 'package:flutter/material.dart';

class ScanConfirmSuksesActivity extends StatefulWidget {
  const ScanConfirmSuksesActivity({super.key});

  @override
  State<ScanConfirmSuksesActivity> createState() =>
      _ScanConfirmSuksesActivityState();
}

class _ScanConfirmSuksesActivityState extends State<ScanConfirmSuksesActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                Container(
                  child:
                      Image.asset('images/sukses.jpg', width: 200, height: 200),
                ),
                Text(
                  "Absen Berhasil",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 10,
                ),
                // Text(
                //   "$code",
                //   style: TextStyle(
                //       color: Colors.black87,
                //       fontSize: 16,
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: 1),
                // ),
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
                      "Done",
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
