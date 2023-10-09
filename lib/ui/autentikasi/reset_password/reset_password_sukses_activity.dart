import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/custom_widget/custom_text.dart';
import 'package:absen_qrcode/ui/custom_widget/follow_button.dart';

class ProfileActivity extends StatelessWidget {
  const ProfileActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Image.asset('images/profile.JPG', width: 200, height: 200),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: const CustomText(text: "Mohammad Dimas Noufal")),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Saya adalah mahasiswa pertukaran pelajar batch 3 USK yang berasal dari universitas muhammadiyah tangerang.',
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
