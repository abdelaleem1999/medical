import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/products/products1/cubits/cubits.dart';

class ListViewProducts3 extends StatefulWidget {
   ListViewProducts3( {this.image, this.name, this.id, this.fav = false, this.price,this.des}) ;
  final String? image;
  final String? name;
  final String? price;
  final String? des;
  final int? id;


  late bool? fav ;


  @override
  _ListViewProducts3State createState() => _ListViewProducts3State();
}

class _ListViewProducts3State extends State<ListViewProducts3> {
  bool isLike = false;

  @override
  void initState() {
    isLike = widget.fav!;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child:
        Row (
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [BoxShadow(color:Color(0xffdce9fa), blurRadius: 0)],
                  //0xfde2eff3
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(widget.image!,fit: BoxFit.fill,height: 55,)
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name!,style:TextStyle(
                    color: Colors.black,
                  ) ,),
                  Text(widget.des!,style:TextStyle(
                    color: Color(0xF8898B8E),
                  ) ,),

                  // Text("ترمومتر للحراره",style:TextStyle(
                  //   color: Color(0x3c424c4e),
                  // ) ,),
                  Text( " السعر "+widget.price!,style:TextStyle(
                      fontWeight: FontWeight.bold
                  ) ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                icon: isLike
                    ? Icon(FontAwesomeIcons.solidHeart, color:  Color(0xff0f387d),)
                    : Icon(FontAwesomeIcons.heart),
                onPressed: () {
                  RealTimeController.of(context).ADD(widget.name!, widget.price!, widget.image!,widget.des!);

                  setState(() {
                    isLike = !isLike;
                  });
                }
            ),



          ],
        )),
        Divider(
        ),

      ],
    );

  }
}
//                  Icon(Test2.group__1,
//                     size: 50,color: Color(0xff0f387d),),