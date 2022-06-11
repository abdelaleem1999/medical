import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/HomeLayout/view.dart';
import 'package:medicia/forgetPassword/forgetPassView.dart';
import 'package:medicia/login/cubits/LoginController.dart';
import 'package:medicia/login/states/states.dart';
import 'package:medicia/login/widgets/forgetTextButton.dart';
import 'package:medicia/login/widgets/signButton.dart';


class LoginBlock extends StatefulWidget {

  @override
  _LoginBlockState createState() => _LoginBlockState();
}

class _LoginBlockState extends State<LoginBlock> {
  final formKey = GlobalKey<FormState>();

  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();
  LoginController _loginController = LoginController();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    final login = LoginController.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10.0,left: 10),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
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

                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),

                    ),

                    hintStyle: TextStyle(color: Colors.black26),
                    hintText: ("البريد الالكتروني"),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 70,
                  child: TextFormField(
                    controller: _Passcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'كلمه المرور فارغه!';
                      } else {
                        return null;
                      }
                    },
                    textAlign: TextAlign.right,
                    obscureText: isPasswordShow,

                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),


                      border: new OutlineInputBorder(

                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(

                        ),
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
          ForgetButton("هل نسيت كلمه المرور ؟", TextAlign.start,
              Color(0xff0267b4),
              ForgetPassView()),

          BlocBuilder(
            bloc: login,

            builder: (context, state) =>
            state is LoginLoading
                ? CircularProgressIndicator()
                : InkWell(
              onTap: () async {
                if (!formKey.currentState!.validate()) return;

                final message = await _loginController.login(
                    _Emailcontroller.text, _Passcontroller.text);
                if ( message != 'ok') {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(message)));
                } else {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeLayout(),

                      ));
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SignButton(name:"تسجيل الدخول" ,
                c: Color(0xff0267b4),),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
// class HomeLayout extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//     );
//   }
// }

