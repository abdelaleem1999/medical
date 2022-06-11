import 'package:flutter/material.dart';
import 'package:medicia/login/components/header.dart';
import 'package:medicia/login/components/loginBlock.dart';
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool isPasswordShow = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [


          LoginHeader(),
          LoginBlock(),
        ],
      ),
    );
  }
}

