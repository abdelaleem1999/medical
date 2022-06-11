import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
   final String? name;
   final Color? c;

  SignButton({@required this.name,this.c,} );

  @override
  Widget build(BuildContext context) {
    return

      Padding(
        padding: const EdgeInsets.only(top: 20,bottom: 0.0),
        child: Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(color: Colors.black38,
                  blurRadius: 2)
            ] ,
            color: c,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/12,
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(name!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),),




            ],
          ),

        ),
      );
  }
}
