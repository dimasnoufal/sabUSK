import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/autentikasi/controller/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
// import 'package:belajar5/admin/homeAdmin.dart'; // admin home
import 'package:absen_qrcode/ui/main/landing_page_activity.dart';
import 'package:absen_qrcode/ui/admin/landing_page_activity.dart';
import 'package:absen_qrcode/ui/autentikasi/register/register_activity.dart';

class LoginActivity extends StatefulWidget {
  @override
  _LoginActivity createState() => _LoginActivity();
}

class _LoginActivity extends State<LoginActivity> {
  late String Semail, Spassword, Snama, level;
  final _formKey = GlobalKey<FormState>();
  String _textFieldValue = ''; // To store the text field value
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void ProsesLogin() async {
    final response = await http
        .post(Uri.parse("http://192.168.43.125/sabuskApi/login.php"), body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    var dataUser = json.decode(response.body);

    if (dataUser.length < 1) {
      setState(() {
        FlutterToastr.show("Email Atau Password salah", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.bottom,
            backgroundColor: Color.fromARGB(255, 191, 180, 180));
      });
    } else {
      setState(() {
        Snama = dataUser[0]["nama"];
        Semail = dataUser[0]["email"];
        Spassword = dataUser[0]["password"];
        level = dataUser[0]["level"];
      });
      if (level == "admin") {
        FlutterToastr.show("Selamat Datang $Snama", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.bottom,
            backgroundColor: Color.fromARGB(255, 191, 180, 180));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await AuthServices.login(emailController.text, passwordController.text);
        prefs.setInt('_conditionValue', 3);
        prefs.setString('nama', Snama);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainApp()));
      } else if (level == "user") {
        FlutterToastr.show("Selamat Datang $Snama", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.bottom,
            backgroundColor: Color.fromARGB(255, 191, 180, 180));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('_conditionValue', 2);
        prefs.setString('nama', Snama);
        await AuthServices.login(emailController.text, passwordController.text);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MyApp()));
      } else {
        FlutterToastr.show("Email Atau Password salah", context,
            duration: FlutterToastr.lengthShort,
            position: FlutterToastr.center,
            backgroundColor: Color.fromARGB(255, 191, 180, 180));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
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
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Please Enter a Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      return null; // Return null for no error
                    },
                    onSaved: (value) {
                      _textFieldValue = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null; // Return null for no error
                    },
                    onSaved: (value) {
                      _textFieldValue = value!;
                    },
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ProsesLogin();
                      }
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
        ),
      ),
    );
  }
}
