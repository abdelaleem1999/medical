import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/cart/cartsView.dart';
import 'package:medicia/cart/cubits/cubits.dart';
import 'package:medicia/header_icons.dart';
import 'package:medicia/login/widgets/signButton.dart';
import 'package:medicia/products/products1/cubits/cubits.dart';

class ProductsDetailsView extends StatefulWidget {
  String? name;
  String? des;
  String? image;
  int? Price;
  int? id;
  ProductsDetailsView( {this.name, this.Price, this.image,this.id,this.des});


  @override
  _ProductsDetailsViewState createState() => _ProductsDetailsViewState();
}

class _ProductsDetailsViewState extends State<ProductsDetailsView> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartsView()));
          }, icon:Icon(Header.cart,color: Colors.grey,size: 38,)),


        ],
        title:Text("معلومات المنتج",
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
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: ListView(
              scrollDirection: Axis.vertical,


              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.image!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name!,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        IconButton(
                            icon: isLike
                                ? Icon(FontAwesomeIcons.solidHeart, color:  Color(0xff0f387d),)
                                : Icon(FontAwesomeIcons.heart),
                            onPressed: () {
                              RealTimeController.of(context).ADD(widget.name!, widget.Price!, widget.image!,widget.des!);

                              setState(() {
                                isLike = !isLike;
                              });
                            }
                        ),


                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("شريط",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                        Text((widget.Price!).toString()+"  جنيه  ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3063ba),

                            )),


                      ],
                    ),
                    Divider(
                      color: Color(0xff051328),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,right: 10,left: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("وصف المنتج",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Text(widget.des!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )),


                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,right: 10,left: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text("المكونات",
                              //     style: TextStyle(
                              //       fontSize: 16,
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.black,
                              //     )),
                              Text(widget.name!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )),


                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0,right: 10,left: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("العلامات التجاليه",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                              Text("NOVAERTS",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  )),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ,

              ] ),
        ),
      ),
      bottomNavigationBar:BlocBuilder(
        bloc: CartsController.of(context),
  builder: (context, state) {
    return InkWell(
        onTap: (){
          CartsController.of(context).AddToCarts(
            widget.name!, widget.Price!, widget.image!, widget.des!);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SignButton(
            name:"اضف الي السله" ,
            c:Color(0xff0267b4) ,
          ),
        ),
      );
  },
) ,

    );
  }
}
