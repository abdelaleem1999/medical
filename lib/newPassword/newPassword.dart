import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicia/forgetPassword/widgets/headerForgetPass.dart';
import 'package:medicia/login/widgets/signButton.dart';

class NewPassView extends StatefulWidget {

  @override
  _NewPassViewState createState() => _NewPassViewState();
}

class _NewPassViewState extends State<NewPassView> {
  final k1= GlobalKey<FormState>();
  TextEditingController _Emailcontroller = TextEditingController();
  TextEditingController _Passcontroller = TextEditingController();
  TextEditingController _fogetPassController =TextEditingController();
  TextEditingController _ConfirmPasscontroller = TextEditingController();
  bool isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90,right: 17,left: 17),
        child: ListView(
          children: [
            HeaderForgetPassText(
              textnamebold: "اعاده نعين الرقم السري",)      ,
            Form(
              key: k1,
              child:Container(
                height: MediaQuery.of(context).size.height/3.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
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
                        hintText: ("كود تأكيد الحساب"),
                      ),
                    ),
                    TextFormField(
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
                        contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),


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
                    // TextName("phone", TextAlign.left, Colors.black, 16),
                    // TextNameField("phone", TextInputType.number,_phoneController),
                    TextFormField(
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
                        contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),

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
                        hintText: ("تاكيد الرقم السري"),
                      ),
                    ),

                  ],
                ),
              ),


            ),
            InkWell(

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
