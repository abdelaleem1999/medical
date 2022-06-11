import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/cart/cartsView.dart';
import 'package:medicia/favourite/widgets/favoriteBody.dart';
import 'package:medicia/header_icons.dart';
import 'package:medicia/products/products1/cubits/cubits.dart';
import 'package:medicia/productsDetails/productsDetailsView.dart';

import '../getStorage.dart';

class FavouriteView extends StatefulWidget {
  @override
  _FavouriteViewState createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartsView()));
              },
              icon: Icon(
                Header.cart,
                color: Colors.grey,
                size: 38,
              )),
        ],
        title: Text("المفضله",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              // Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.angleRight,
              size: 25,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            children: [
              BlocBuilder(
                bloc: RealTimeController.of(context),
                builder: (context, state) {
                  if (Get.find<Database>().restoreList() == null
                  ||Get.find<Database>().restoreList()!.isEmpty) {
                    return Text("لا يوجد عناصر");
                  } else {
                    return ListView.builder(
                      itemCount: Get.find<Database>().restoreList()!.length,
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          // Navigator.push
                          //   (context, MaterialPageRoute(builder: (context)=>ProductsDetailsView(
                          //   image: FavouriteController.of(context).models[index].image,
                          //   name: FavouriteController.of(context).models[index].name!,
                          //   Price: FavouriteController.of(context).models[index].price!.toString(),
                          //   des:controller.models[index].descraption! ,
                          // )));
                        },
                        child: PavBody(
                          name: Get.find<Database>().restoreList()![index][0],
                          image: Get.find<Database>().restoreList()![index][2],
                          price: Get.find<Database>().restoreList()![index][1].toString(),
                          id: index,
                          // fav: true,
                          navigator: ProductsDetailsView(
                            image: Get.find<Database>().restoreList()![index]
                                [2],
                            name: Get.find<Database>().restoreList()![index][0],
                            Price:int.parse(
                                Get.find<Database>().restoreList()![index][1]),
                            des: Get.find<Database>().restoreList()![index][3],
                            //  RealTimeController.of(context).Adds![index][3]
                          ),
                        ),
                        // Column(
                        //   children: [
                        //     Text(RealTimeController.of(context).Adds[index][0]),
                        //     Image.asset(RealTimeController.of(context).Adds[index][2]),
                        //   ],
                        // ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
