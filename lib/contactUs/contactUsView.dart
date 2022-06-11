import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/addressDetails/verfiyOrder/verfiyOrderView.dart';
import 'package:medicia/addressDetails/widgets/customsFields.dart';
import 'package:medicia/cart/cubits/cubits.dart';
import 'package:medicia/login/widgets/signButton.dart';

class ContactUsView extends StatefulWidget {

  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final k= GlobalKey<FormState>();

  TextEditingController emailController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title:Text("تواصل معنا ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),

        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);

        },
            icon: Icon(
              FontAwesomeIcons.angleRight, size: 25, color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Container(
          height: MediaQuery.of(context).size.height/1.5,
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              boxShadow: [

                BoxShadow(color: Colors.grey,
                    blurRadius: 4)
              ] ,
              border: Border.all(color: Colors.white)
          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,

            children: [

              Center(child: Container(
                height: MediaQuery.of(context).size.height/3.4,
                  child: Image.asset("assets/images/medicia/Group 831.png"))),
              Text("نحن سعداء لتلقي رسائلك واقتراحتكم"),
              Form(
                key: k,
                child: CustomsFilds(
                  controller:emailController ,
                  hint: "اضف رساله",
                  widget:TextInputType.text ,

                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("للمزيد اتصل ب"),
                  Text("33445",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:BlocBuilder(
        bloc: CartsController.of(context),
  builder: (context, state) {
    return InkWell(
      onTap: ()async{
    if (!k.currentState!.validate()){
      return null;
    }else{
      CartsController.of(context).AddToNot();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VerfiyOrderView()));

    }


      },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SignButton(
            name:"ارسال " ,
            c:Color(0xff0c558b) ,
          ),
        ),
      );
  },
) ,


    );
  }
}
