import 'package:flutter/material.dart';

import 'package:absen_qrcode/ui/custom_widget/custom_text.dart';
import 'package:absen_qrcode/ui/custom_widget/follow_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  State<ProfileActivity> createState() => _ProfileActivityState();
}

class _ProfileActivityState extends State<ProfileActivity> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername(); // Panggil fungsi untuk mengambil data saat widget pertama kali diinisialisasi
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Ambil data dari SharedPreferences
    String savedUsername = prefs.getString('nama') ?? 'Nama';

    // Setel state untuk memperbarui widget dengan nilai terbaru
    setState(() {
      username = savedUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Image.asset('images/users.jpg', width: 200, height: 200),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: CustomText(text: username)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      Icon(Icons.man),
                      SizedBox(height: 8.0),
                      Text('Male'),
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      Icon(Icons.school),
                      SizedBox(height: 8.0),
                      Text('lecture')
                    ],
                  ),
                  Column(
                    children: const <Widget>[
                      Icon(Icons.house),
                      SizedBox(height: 8.0),
                      Text('Earth'),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Saya adalah dosen',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            FollowButton(),
          ],
        ),
      ),
    );
  }
}
