import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/HomeLayout/view.dart';
import 'package:medicia/core/shared_helper.dart';
import 'package:medicia/login/widgets/signButton.dart';
import 'package:medicia/signup/cubits/signUpController.dart';
import 'package:medicia/signup/states/states.dart';
import 'package:medicia/signup/widgets/textNameFiled.dart';

class SignUpBlock extends StatefulWidget {

  @override
  _SignUpBlockState createState() => _SignUpBlockState();
}

class _SignUpBlockState extends State<SignUpBlock> {
  final formKey2 = GlobalKey<FormState>();
  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();
  TextEditingController _ConfirmPasscontroller = TextEditingController();
  SignUpController _signUpController = SignUpController();
  bool isPasswordShow = false;
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: formKey2,
            child: Container(
              height: MediaQuery.of(context).size.height/2.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TextName("الاسم بالكامل ", TextAlign.right, Colors.black, 16),
                  TextNameField("الاسم بالكامل", TextInputType.name,_nameController),
                  // TextName("Email", TextAlign.right, Colors.black, 16),
                  TextFormField(
                    controller: _Emailcontroller,
                    validator: (value) {
                      if (!value!.isEmpty &&
                          !value.contains('@')) {
                        return ' البريد الالكتروني غير صحيح ';
                      }else if (value.isEmpty){
                        return 'البريد الالكتروني فارغ';
                      }
                      else {
                        return null;
                      }
                    },
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(6.0),
                        borderSide: new BorderSide(),

                      ),

                      hintStyle: TextStyle(color: Colors.black26),
                      hintText: ("البريد الالكتروني"),
                    ),
                  ),
                  // TextName("Password", TextAlign.left, Colors.black, 16),
                  Container(
                    height: 70,
                    child: TextFormField(
                      controller: _Passcontroller,
                      validator: (value) {
                        if (value!.isEmpty|| value.length < 7) {
                          return 'كلمه المرور قصيره!';
                        } else {
                          return null;
                        }
                      },
                      textAlign: TextAlign.right,
                      obscureText: isPasswordShow,

                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),

                        border: new OutlineInputBorder(

                          borderRadius: new BorderRadius.circular(6.0),
                          borderSide: new BorderSide(),
                        ),

                        suffix: IconButton(
                          icon: isPasswordShow
                              ? Icon(Icons.visibility_sharp,)
                              : Icon(Icons.visibility_off,),
                          onPressed: () {
                            setState(() {
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                        ),


                        hintStyle: TextStyle(color: Colors.black26),
                        hintText: ("الرقم السري"),
                      ),
                    ),
                  ),
                  // TextName("phone", TextAlign.left, Colors.black, 16),
                  // TextNameField("phone", TextInputType.number,_phoneController),
                  Container(
                    height: 70,
                    child: TextFormField(
                      controller: _ConfirmPasscontroller,
                      validator: (value) {
                        if (value != _Passcontroller.text) {
                          return 'كلمه المرور غير متطابقة';
                        } else {
                          return null;
                        }
                      },
                      textAlign: TextAlign.right,
                      obscureText: isPasswordShow,

                      decoration: InputDecoration(
                        contentPadding: new EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),

                        border: new OutlineInputBorder(

                          borderRadius: new BorderRadius.circular(6.0),
                          borderSide: new BorderSide(),
                        ),

                        suffix: IconButton(
                          icon: isPasswordShow
                              ? Icon(Icons.visibility_sharp,)
                              : Icon(Icons.visibility_off,),
                          onPressed: () {
                            setState(() {
                              isPasswordShow = !isPasswordShow;
                            });
                          },
                        ),


                        hintStyle: TextStyle(color: Colors.black26),
                        hintText: ("الرقم السري"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocBuilder(
            bloc: SignUpController.of(context),
            builder: (context, state) =>state is SignUpLoading
                ? CircularProgressIndicator()

                : InkWell(
              onTap: () async {
                if (!formKey2.currentState!.validate()) return;

                final message = await SignUpController.of(context).signUp(
                    _Emailcontroller.text, _Passcontroller.text,
                    // _nameController.text,_phoneController.text
                );
                if (message == 'البريد الالكتروني خطأ') {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message!)));
                } else {
                  SharedHelper.setName(_nameController.text);
                  // print(emailController.text * 9);
                  // print(passwordController.text * 29);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeLayout(),
                      ));
                }
              },
              child:    SignButton(name:"تسجيل جديد" ,
              c: Color(0xff0267b4)),
            ),
          ),

        ],
      ),
    );
  }
}
