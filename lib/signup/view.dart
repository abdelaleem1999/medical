import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/login/view.dart';
import 'package:medicia/signup/components/header.dart';
import 'package:medicia/signup/components/signupBlock.dart';
import 'package:medicia/signup/cubits/signUpController.dart';
import 'package:medicia/widgets/textButtonColor.dart';

class SignUpView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<SignUpView> {
  final formKey2 = GlobalKey<FormState>();
  bool isPasswordShow = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SignupHeader(),
            SignUpBlock(),
            // TextButtonName("Already have an Accont? ", "Login",
            //     Colors.purpleAccent, LoginView()),
          ],
        ),
      ),
    );
  }
}
