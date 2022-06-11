import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/cart/cartsView.dart';
import 'package:medicia/header_icons.dart';
import 'package:medicia/home/widgets/rowHomeHeader.dart';
import 'package:medicia/products/products1/productsView.dart';
import 'package:medicia/products/products2/productView2.dart';
import 'package:medicia/products/products3/productView2.dart';
import 'package:medicia/test2_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';



class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final List<String> imgList = [
    "assets/images/medicia/3.1.jpeg",
    "assets/images/medicia/3.2.jpeg",
    "assets/images/medicia/3.3.jpeg",
    "assets/images/medicia/3.4.jpeg",
    "assets/images/medicia/3.5.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    File file;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartsView()));
                }, icon:Icon(Header.cart,color: Colors.grey,size: 38,)),
                Row(
                  children: [
                    Text("medicia",
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Image.asset("assets/images/Group 1.png",fit: BoxFit.fill,
                      height: 60,
                    ) ,

                  ],
                ),

                CircleAvatar(backgroundImage: AssetImage("assets/images/profile.jpg"),radius: 21,),
              ],
            ),
            Container(
              color: Color(0xfdf0f2f3),
              child: TextField(

                cursorColor: Colors.indigoAccent,
                cursorHeight: 25,
                decoration: InputDecoration(
                  hintText: "ما الذي تبحث عنه",

               fillColor: Colors.white,

                    border: InputBorder.none,

                    prefixIcon:IconButton(onPressed: (){


                    }, icon:Icon(Icons.search,size: 35,))),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()async{
                      final pickedFile =
                      await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile == null) return;
                      file = File(pickedFile.path);


                  },
                  child: RowHomeHeader2(
                    textname:" روشته/ موافقه  " ,
                    icons: Header.picture,
                    textname2: "طبيه",
                    colors:Color(0xfde2eff3) ,
                  ),
                ),
                InkWell(
                  onTap: ()async{
                    final pickedFile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                    if (pickedFile == null) return;
                    file = File(pickedFile.path);


                  },
                  child: RowHomeHeader2(
                    textname:"صوره" ,
                    icons: Header.camera,
                    textname2: " المنتج",
                    colors:Color(0xfde2eff3) ,
                  ),
                ),
                InkWell(
                  onTap: ()async{
                      await launch('tel:0144455574'

                        // forceSafariVC: false,
                        // forceWebView: false,
                      );


                  },


                  child: RowHomeHeader2(
                    textname:"استشير" ,
                    icons: Header.phone,
                    textname2: "صيدلي",
                    colors:Color(0xfde2eff3) ,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text("الاكتر طلبا",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,

            ),),
            Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlayCurve: Curves.easeInOutBack,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: imgList
                      .map((item) => Container(
                    child: Center(
                        child: Image.asset(
                          item,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height/3,
                        )),
                  ))
                      .toList(),
                )),
            Text("المنتجات",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,

              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RowHomeHeader(
                  widget:ProductsView1() ,
                  textname:" ادويه  " ,
                  icons: Test2.group__3,
                  textname2: "طبيه",
                  colors: Color(0xfff4f7fc),
                ),
                RowHomeHeader(
                  widget: ProductsView3(),
                  textname:"معدات" ,
                  icons: Test2.group__2,
                  textname2: "الدكاترة",
                  colors:Color(0xfff4f7fc) ,
                ),
                RowHomeHeader(
                  widget: ProductsView2(),
                  textname:"معدات" ,
                  icons: Test2.group__1,
                  textname2: "طبية",
                  colors:Color(0xfff4f7fc) ,
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),

            Container(

              height:MediaQuery.of(context).size.height/9 ,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color:  Color(0xfdb8bcc1), blurRadius: 5)],

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.child,color: Color(0xfd4086b4),size: 40,),
                  Column(
                    children: [
                      Text("اضف تأميتك الصحي",
                        style: TextStyle(
                            fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      Text("لتتمكن من استخدامه في طلباتك القادمه",
                          style: TextStyle(
                              color: Color(0x454D5050),
                            fontSize: 12
                          )),

                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  InkWell(
                      onTap: ()async{
                        final pickedFile =
                        await ImagePicker().pickImage(source: ImageSource.gallery);
                        if (pickedFile == null) return;
                        file = File(pickedFile.path);


                      },
                      child: Icon(Icons.add,color: Color(0xfd4086b4),size: 40,)),

                ],
              ),
            ),




          ],
        ),
      ),
    );
  }
}
