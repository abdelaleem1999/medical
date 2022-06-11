import 'package:flutter/material.dart';
import 'package:medicia/login/view.dart';
import 'package:medicia/widgets/loginText.dart';

class SignupHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SignImage(),
          TextLogin("تسجيل حساب جديد"," لديك حساب بالفعل ؟","تسجيل الدخول",LoginView()),

        ],
      ),
    );
  }
}
