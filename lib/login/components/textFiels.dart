import 'package:flutter/material.dart';
import 'package:medicia/widgets/textEmailField.dart';
import 'package:medicia/widgets/textPassField.dart';
import 'package:medicia/widgets/textname.dart';

class TextFields extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextName("Email",TextAlign.left,Colors.black,16),
        TextEmailField(),
        TextName("Password",TextAlign.left,Colors.black,16),
        TextPassField(),
      ],
    );
  }
}
