import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingComponentRow extends StatelessWidget {
  late final IconData? icon;
  late final IconData? icon2;
  late final String? name;
  late final Function? NavigatorTo;

  SettingComponentRow({
    this.icon,
    this.icon2,
    this.name,
    this.NavigatorTo
});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon!,
            color:Color(0xfd214b97) ,
          ),
        ),
        Text(name!,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon2!,
            color:Color(0xfd214b97) ,
            size: 33,
          ),
        ),

      ],
    );
  }
}
