import 'package:flutter/material.dart';
import 'package:absen_qrcode/theme/theme.dart';
import 'package:absen_qrcode/ui/custom_widget/custom_checkbox.dart';
import 'package:absen_qrcode/ui/custom_widget/primary_button.dart';

class RegisterPageActivity extends StatefulWidget {
  const RegisterPageActivity({Key? key}) : super(key: key);

  @override
  _RegisterPageActivity createState() => _RegisterPageActivity();
}

class _RegisterPageActivity extends State<RegisterPageActivity> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  bool passwordVisible = false;
  bool passwordConfirmVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(24, 40, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'APP Flutter\nRegister',
                  style: heading2.copyWith(color: textBlack),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/accent.png',
                  width: 99,
                  height: 4,
                )
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Form(
                child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: textWhiteGrey,
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: heading6.copyWith(color: textGrey),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: textWhiteGrey,
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: heading6.copyWith(color: textGrey),
                        suffixIcon: IconButton(
                          color: textGrey,
                          splashRadius: 1,
                          icon: Icon(passwordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                          onPressed: togglePassword,
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: textWhiteGrey,
                      borderRadius: BorderRadius.circular(14)),
                  child: TextFormField(
                    obscureText: !passwordConfirmVisible,
                    decoration: InputDecoration(
                        hintText: 'Password Confirmation',
                        hintStyle: heading6.copyWith(color: textGrey),
                        suffixIcon: IconButton(
                          color: textGrey,
                          splashRadius: 1,
                          icon: Icon(passwordConfirmVisible
                              ? Icons.visibility_outlined
                              : Icons.voice_over_off_outlined),
                          onPressed: () {
                            setState(() {
                              passwordConfirmVisible = !passwordConfirmVisible;
                            });
                          },
                        ),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckbox(),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'By creating an account, you agree to our',
                      style: regular16pt.copyWith(color: textGrey),
                    ),
                    Text(
                      'Term & Condition',
                      style: regular16pt.copyWith(color: primaryBlue),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            CustomPrimaryButton(
              buttonColor: primaryBlue,
              textValue: 'Register',
              textColor: Colors.white,
              email: emailController.text,
              password: passwordController.text,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: regular16pt.copyWith(color: textGrey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: regular16pt.copyWith(color: primaryBlue),
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
