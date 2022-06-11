import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/addressDetails/widgets/customsFields.dart';
import 'package:medicia/editProfile/cubits/cubits.dart';
import 'package:medicia/login/cubits/LoginController.dart';
import 'package:medicia/login/widgets/signButton.dart';

class EditProfileView extends StatefulWidget {

  @override
  _EditProfileViewState createState() => _EditProfileViewState();

}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _NameController=TextEditingController();
  final TextEditingController _NumberController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: AddressDetailsController.of(context),
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title:Text("تعديل بياناتي ",
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("الاسم بالكامل",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                )),
            CustomsFilds(
              widget: TextInputType.name,
              width:MediaQuery.of(context).size.width ,
              hint:"الاسم بالكامل" ,
              controller: AddressDetailsController.of(context).nameController,
            ),
            Text("رقم التليفون",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                )),

            CustomsFilds(
              widget: TextInputType.phone,
              width:MediaQuery.of(context).size.width ,
              hint:" الرقم" ,
              controller: AddressDetailsController.of(context).numberController,
            ),
            Text("الايميل الالكتروني",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                )),
//             BlocBuilder(
//               bloc: LoginController.of(context),
//   builder: (context, state) {
//     return CustomsFilds(
//               widget: TextInputType.name,
//               width:MediaQuery.of(context).size.width ,
//               hint:" الايميل " ,
//               controller: LoginController.of(context).emailController,
//             );
//   },
// ),


            // TextButton(onPressed: (){
            //   AddressDetailsController.of(context).SaveAddressDetails(
            //       AddressDetailsController.of(context).nameController.text,
            //       AddressDetailsController.of(context).numberController.text
            //   );
            //
            // }, child: Text("aaaaaaaaaaaaaaaaaaaa")),
          ],
        ),
      ),
      bottomNavigationBar:InkWell(
        onTap: (){
          AddressDetailsController.of(context).SaveAddressDetails(
              AddressDetailsController.of(context).nameController.text,
              AddressDetailsController.of(context).numberController.text
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("تم تعديل بياناتك بنجاح")));

        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SignButton(
            name:" حفظ بياناتي" ,
            c:Color(0xff0c558b) ,
          ),
        ),
      ),
    

    );
  },
);
  }
}
