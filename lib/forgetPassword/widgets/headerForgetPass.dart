import 'package:flutter/material.dart';
import 'package:google_language_fonts/google_language_fonts.dart';


class HeaderForgetPassText extends StatelessWidget {
   final String? textnamebold;


  HeaderForgetPassText({ @required this.textnamebold}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(textnamebold!,

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text("medicia",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Image.asset("assets/images/Group 1.png",fit: BoxFit.fill,
                // height: 80,
              ) ,

            ],
          ),


        ],
      ),



    );
  }
}
