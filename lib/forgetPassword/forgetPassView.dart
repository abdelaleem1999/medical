import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicia/forgetPassword/widgets/headerForgetPass.dart';
import 'package:medicia/login/widgets/signButton.dart';
import 'package:medicia/newPassword/newPassword.dart';

class ForgetPassView extends StatefulWidget {

  @override
  _ForgetPassViewState createState() => _ForgetPassViewState();
}

class _ForgetPassViewState extends State<ForgetPassView> {
  final k1= GlobalKey<FormState>();
  TextEditingController _fogetPassController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90,right: 17,left: 17),
        child: ListView(
          children: [
            HeaderForgetPassText(
              textnamebold: "البريد الالكتروني المستخدم",)      ,
        Padding(
          padding: const EdgeInsets.only(top: 12,bottom: 12),
          child: Form(
            key: k1,
            child: TextFormField(
              controller: _fogetPassController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "validation";

                } else {
                  return null;
                }
              },
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                contentPadding: new EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0),

                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(6.0),
                  borderSide: new BorderSide(),

                ),

                hintStyle: TextStyle(color: Colors.black26),
                hintText: ("البريد الالكتروني"),
              ),
            ),

          ),

        ),
            InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPassView()));
              },
              child: SignButton(
                name:"تاكيد" ,
                c:Color(0xff0267b4) ,
              ),
            ),

        ],
        ),
      ),
    );
  }
}
