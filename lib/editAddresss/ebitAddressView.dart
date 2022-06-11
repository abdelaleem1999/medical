import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/addressDetails/widgets/customsFields.dart';
import 'package:medicia/cheekOut/cheekOutView.dart';
import 'package:medicia/editProfile/cubits/cubits.dart';
import 'package:medicia/editProfile/editProfileView.dart';
import 'package:medicia/login/widgets/signButton.dart';
import 'package:medicia/signup/widgets/textNameFiled.dart';
import 'package:medicia/test2_icons.dart';

class EditAddressView extends StatefulWidget {

  @override
  _EditAddressViewState createState() => _EditAddressViewState();
}

class _EditAddressViewState extends State<EditAddressView> {
  final k1= GlobalKey<FormState>();

  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _streetController=TextEditingController();
  final TextEditingController _homeNumberController=TextEditingController();
  final TextEditingController _homeNumberController2=TextEditingController();
  final TextEditingController _HomeMarkerController=TextEditingController();
  final TextEditingController _NumberController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("تفاصيل العنوان",
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

      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                boxShadow: [BoxShadow(color: Color(0xffbfc2c4) , blurRadius: 0)],
                color: Colors.white70,
              ),

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("منطقه الوصيل",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        // Spacer(),
                        // Icon(FontAwesomeIcons.edit,color: Color(0xff0267b4) ,),
                        // TextButton(
                        //     style: ButtonStyle(
                        //       foregroundColor: MaterialStateProperty.all<Color>(Color(0xff0267b4)) ,
                        //     ),
                        //     onPressed: (){
                        //
                        //     }, child: Text("تعديل")),
                      ],
                    ),
                    Text("المنصوره ,الدقهليه, مصر",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),


                  ],
                ),
              ),
            ),
            Form(
              key: k1,
              child:Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomsFilds(
                    controller: _streetController,
                    hint: "اسم الشارع",
                  )    ,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomsFilds(
                        controller: _homeNumberController,
                        hint: "رقم العماره ",
                        width: MediaQuery.of(context).size.width/2.4,
                        widget: TextInputType.number,

                      )    ,
                      CustomsFilds(
                        controller: _homeNumberController2,
                        hint: "رقم الشقه",
                        width: MediaQuery.of(context).size.width/2.4,
                        widget: TextInputType.number,
                      )    ,


                    ],
                  ),
                  CustomsFilds(
                    controller: _HomeMarkerController,
                    hint: "علامه مميزه",
                  )    ,
                  Divider(
                    height: 20,
                    color: Color(0xffe9ebec) ,
                    thickness: 4,
                  ),
                  CustomsFilds(
                    controller: _nameController,
                    hint: "الاسم بالكامل",
                  )    ,
                  CustomsFilds(
                    controller: _NumberController,
                    hint: "رقم الهاتف",
                    widget: TextInputType.phone,
                  )    ,



                ],
              ),


            ),

          ],
        ),
      ),
      bottomNavigationBar:BlocBuilder(
        bloc: AddressDetailsController.of(context),
        builder: (context, state) {
          return InkWell(
            onTap: () async {
              if (!k1.currentState!.validate()) return;

              else {

                Navigator.pop(context);

              }
            },        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SignButton(
              name:"استمرار" ,
              c:Color(0xff0c558b) ,
            ),
          ),
          );
        },
      ) ,

    );
  }
}
