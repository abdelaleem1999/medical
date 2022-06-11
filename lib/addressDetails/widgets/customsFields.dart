import 'package:flutter/material.dart';

class CustomsFilds extends StatelessWidget {
  final String? hint;
  final double? width;
  final TextEditingController? controller;
  final TextInputType? widget;

  CustomsFilds({ this.hint, this.controller,this.width, this.widget});


  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
         width:width ,
         child: TextFormField(
           keyboardType:widget,

          controller: controller,
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
            hintText: (hint),
          ),
    ),
       ),
     );

  }
}
