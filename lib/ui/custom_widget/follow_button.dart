import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:absen_qrcode/ui/autentikasi/controller/auth_service.dart';

import 'package:absen_qrcode/ui/autentikasi/login/login_activity.dart';

class FollowButton extends StatefulWidget {
  _FollowButton createState() => _FollowButton();
}

class _FollowButton extends State<FollowButton> {
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        child: Text('Logout'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.clear();
          prefs.setInt('_conditionValue', 1);
          await AuthServices.logout();
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => LoginActivity()));
        },
      ),
    );
  }
}
