import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/cart/cartsView.dart';
import 'package:medicia/header_icons.dart';
import 'package:medicia/products/products2/widgets/listviewProducts.dart';
import 'package:medicia/products/products3/cubits/cubits.dart';
import 'package:medicia/productsDetails/productsDetailsView.dart';

class ProductsView3 extends StatefulWidget {

  @override
  _ProductsView3State createState() => _ProductsView3State();
}

class _ProductsView3State extends State<ProductsView3> {
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
        title:Text("معدات طبيه",
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

      body: SafeArea(
        child: ListView(
            scrollDirection: Axis.vertical,


            children: [
              Column(
                children: [
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
                  BlocBuilder(
                    bloc: RealTimeController3.of(context),
                    builder: (context, state) {
                      final controller3 = RealTimeController3.of(context);
                      if(RealTimeController3.of(context).models==null){
                        return Center(child: CircularProgressIndicator());
                      }else{
                        return ListView.builder(
                          itemCount: controller3.models.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),

                          scrollDirection:Axis.vertical ,
                          itemBuilder: (context, index) => InkWell(
                            onTap: (){
                              Navigator.push
                                (context, MaterialPageRoute(builder: (context)=>ProductsDetailsView(
                                image: RealTimeController3.of(context).imageS[index],
                                name: RealTimeController3.of(context).models[index].name!,
                                Price: RealTimeController3.of(context).models[index].price!,
                                des:RealTimeController3.of(context).models[index].des! ,
                              )));

                            },
                            child: ListViewProducts2(
                              image: RealTimeController3.of(context).imageS[index],
                              name: RealTimeController3.of(context).models[index].name!,
                              price: RealTimeController3.of(context).models[index].price!.toString(),
                              des: RealTimeController3.of(context).models[index].des!,

                            ),
                          ),
                        );

                      }

                    },
                  )
                ],
              ) ,

            ] ),
      ),
    );
  }
}
