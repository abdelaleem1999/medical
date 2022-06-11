import 'package:flutter/material.dart';
import 'package:medicia/signup/view.dart';
import 'package:medicia/widgets/loginText.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LoginImage(),
            TextLogin("تسجيل الدخول الي حسابك","ليس لديك حساب ؟","تسجيل جديد",SignUpView()
            ),
          ],
        ),
      ),
    );
  }
}
