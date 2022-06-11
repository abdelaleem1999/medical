import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TextNameField extends StatelessWidget {
  GlobalKey<FormState> k1 = GlobalKey<FormState>();
  late final String hintname;
   final TextInputType _widgets;
   final TextEditingController _nameController;

  TextNameField(this.hintname,this._widgets,this._nameController);
  @override
  Widget build(BuildContext context) {
    return
      Form(
        key: k1,
        child: TextFormField(
          controller: _nameController,
          keyboardType:_widgets,
          validator: (value) {
            if (value!.isEmpty) {
              return "validation";

            } else {
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
            hintText: ("الاسم بالكامل"),
          ),
        ),

    );
  }
}
