import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:absen_qrcode/ui/introduction/introduction_activity.dart';
import 'package:absen_qrcode/ui/autentikasi/login/login_activity.dart';
import 'package:absen_qrcode/ui/main/landing_page_activity.dart';
import 'package:absen_qrcode/ui/admin/landing_page_activity.dart';

class SplashActivity extends StatefulWidget {
  _SplashActivity createState() => _SplashActivity();
}

class _SplashActivity extends State<SplashActivity> {
  void initState() {
    super.initState();
    splashStart();
  }

  Future splashStart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? conditionValue = prefs.getInt('_conditionValue') ?? 0;

    if (conditionValue == 0) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => IntroductionActivity()),
        );
        prefs.setInt('_conditionValue', 1);
      });
    } else if (conditionValue == 1) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginActivity()),
        );
      });
    } else if (conditionValue == 2) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyApp()),
        );
      });
    } else if (conditionValue == 3) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainApp()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
