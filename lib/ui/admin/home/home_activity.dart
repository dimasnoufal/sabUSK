import 'dart:io';
import 'dart:typed_data';

import 'package:absen_qrcode/ui/admin/attendance/list_attendance_activity.dart';
import 'package:absen_qrcode/ui/admin/attendance_recap/attendance_recap_activity.dart';
import 'package:absen_qrcode/ui/admin/generate_qr/generate_qr_activity.dart';
import 'package:absen_qrcode/ui/admin/schedule/list_matakuliah_activity.dart';
import 'package:absen_qrcode/ui/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/main/home/home_detail/home_detail_activity.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Container(
          child: GridView.count(
            padding: const EdgeInsets.all(25),
            crossAxisCount: 2,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenerateQrActivity(),
                        ));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.generating_tokens,
                          size: 70,
                          color: Color.fromARGB(255, 235, 235, 48),
                        ),
                        Text("Generator QR", style: TextStyle(fontSize: 17.0)),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListMatakuliahPage(),
                        ));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(
                          Icons.schedule,
                          size: 70,
                          color: Color.fromARGB(255, 53, 124, 238),
                        ),
                        Text("Add Schedule", style: TextStyle(fontSize: 17.0)),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(8),
                child: InkWell(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListAttendanceActivity(),
                        ));
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        Icon(Icons.book,
                            size: 70, color: Color.fromARGB(255, 215, 64, 4)),
                        Text("Attendance", style: TextStyle(fontSize: 17.0)),
                      ],
                    ),
                  ),
                ),
              ),
              // Card(
              //   margin: const EdgeInsets.all(8),
              //   child: InkWell(
              //     onTap: () async {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => AttendanceRecapActivity(),
              //           ));

              //       final pdf = pw.Document();

              //       var data = await rootBundle
              //           .load("assets/fonts/opensans/OpenSans-Regular.ttf");
              //       var myFont = pw.Font.ttf(data);
              //       var myStyle = pw.TextStyle(font: myFont);

              //       pdf.addPage(
              //         pw.MultiPage(
              //           pageFormat: PdfPageFormat.a4,
              //           build: (context) {
              //             return [
              //               pw.Text("Dimas Noufal", style: myStyle),
              //             ];
              //           },
              //         ),
              //       );

              //       Uint8List bytes = await pdf.save();

              //       final dir = await getApplicationDocumentsDirectory();
              //       File file = File("${dir.path}/mydocument.pdf");

              //       // masukin data bytesnya ke file pdf
              //       await file.writeAsBytes(bytes);

              //       await OpenFile.open(file.path);

              //       print(file.path);
              //     },
              //     splashColor: Colors.blue,
              //     child: Center(
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: const <Widget>[
              //           Icon(
              //             Icons.print,
              //             size: 70,
              //             color: Color.fromARGB(255, 12, 208, 52),
              //           ),
              //           Text("Attendance Recap",
              //               style: TextStyle(fontSize: 17.0)),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
