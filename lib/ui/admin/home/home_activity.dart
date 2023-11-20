import 'package:absen_qrcode/ui/admin/generate_qr/generate_qr_activity.dart';
import 'package:absen_qrcode/ui/admin/schedule/list_matakuliah_activity.dart';
import 'package:absen_qrcode/ui/custom_widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/main/home/home_detail/home_detail_activity.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
