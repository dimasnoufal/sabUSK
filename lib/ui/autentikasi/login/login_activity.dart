import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/autentikasi/controller/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:absen_qrcode/ui/main/landing_page_activity.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivity createState() => _LoginActivity();
}

class _LoginActivity extends State<LoginActivity> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('images/logo.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Please Enter a Email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              // padding: const EdgeInsets.all(16.0),
              height: 50,
              width: 250,
              child: ElevatedButton(
                child: Text('Login', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setInt('_conditionValue', 2);
                  await AuthServices.login(
                      emailController.text, passwordController.text);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => MyApp()));
                },
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('Sistem absensi USK')
          ],
        ),
      ),
    );
  }
}
