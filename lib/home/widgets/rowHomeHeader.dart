import 'package:flutter/material.dart';

class RowHomeHeader extends StatelessWidget {
  final String? textname;
  final String? textname2;
 late final Color? colors;
 late final IconData? icons;
 late final Widget? widget;

   RowHomeHeader({ this.textname,this.textname2, this.icons,this.colors
   ,
   this.widget}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height/9 ,
      width: MediaQuery.of(context).size.width/3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color:colors!, blurRadius: 0)],
      //0xfde2eff3
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>widget!));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icons!,color: Color(0xfd4086b4),),
            Text(textname!,
            style: TextStyle(
              color: Color(0xfd4086b4)
            ),),
            Text(textname2!,
                style: TextStyle(
                    color: Color(0xfd4582a8)
                )),
          ],
        ),
      ),
    );
  }
}
class RowHomeHeader2 extends StatelessWidget {
  final String? textname;
  final String? textname2;
 late final Color? colors;
 late final IconData? icons;
 late final Widget? widget;

   RowHomeHeader2({ this.textname,this.textname2, this.icons,this.colors}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height/9 ,
      width: MediaQuery.of(context).size.width/3.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color:colors!, blurRadius: 0)],
      //0xfde2eff3
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icons!,color: Color(0xfd4086b4),),
          Text(textname!,
          style: TextStyle(
            color: Color(0xfd4086b4)
          ),),
          Text(textname2!,
              style: TextStyle(
                  color: Color(0xfd4582a8)
              )),
        ],
      ),
    );
  }
}
