import 'package:absen_qrcode/ui/autentikasi/controller/auth_service.dart';
import 'package:absen_qrcode/ui/autentikasi/login/login_activity.dart';
import 'package:flutter/material.dart';
import 'package:absen_qrcode/theme/theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final String email;
  final String password;

  const CustomPrimaryButton(
      {this.buttonColor = Colors.black,
      this.textValue = '',
      this.textColor = Colors.black,
      this.email = '',
      this.password = ''});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(14)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(14),
            child: ElevatedButton(
              onPressed: () async {
                await AuthServices.register(email, password);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => LoginActivity()));
              },
              child: Text(
                textValue,
                style: heading5.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
