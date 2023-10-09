import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/main/home/home_detail/home_detail_activity.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Jadwal Kuliah'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: List.generate(20, (index) {
          return ListTile(
            title: Text('Jadwal Kuliah $index'),
            subtitle: Text('Description $index'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => HomeDetailActivity()));
            },
          );
        }),
      ),
    );
  }
}
