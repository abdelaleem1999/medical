import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/favourite/cubits/cubits.dart';
import 'package:medicia/favourite/states/states.dart';
import 'package:medicia/products/products1/cubits/cubits.dart';

import '../../getStorage.dart';

class PavBody extends StatefulWidget {
  PavBody(
      {this.image,
      this.name,
      this.fav = true,
      this.price,
      this.id,
      this.navigator});
  final String? image;
  final String? name;
  final String? price;
  final int? id;
  final Widget? navigator;

  late bool? fav;

  @override
  _PavBodyState createState() => _PavBodyState();
}

class _PavBodyState extends State<PavBody> {
  bool isLike = true;

  @override
  void initState() {
    isLike = widget.fav!;
    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: RealTimeController.of(context),
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => widget.navigator!));
              },
              child: Container(
                  child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(color: Color(0xffdce9fa), blurRadius: 0)
                        ],
                        //0xfde2eff3
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            widget.image!,
                            fit: BoxFit.fill,
                            height: 55,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name!,
                          style: TextStyle(
                            color: Color(0xF8898B8E),
                          ),
                        ),
                        // Text("ترمومتر للحراره",style:TextStyle(
                        //   color: Color(0x3c424c4e),
                        // ) ,),
                        Text(" السعر " + widget.price!,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Spacer(),
                  BlocProvider(
                    create: (context) => FavouriteController(),
                    child: BlocBuilder(
                      bloc: FavouriteController.of(context),
                      builder: (context, state) {
                        return IconButton(
                            icon: isLike
                                ? Icon(
                                    FontAwesomeIcons.solidHeart,
                                    color: Color(0xff0f387d),
                                  )
                                :
                            Icon(FontAwesomeIcons.heart),
                            onPressed: () {
                              if (isLike) {


                                print( Get.find<Database>().restoreList()!);
                                Get.find<Database>().restoreList()!.removeAt(widget.id!);
                                Get.find<Database>().storeList(Get.find<Database>().restoreList()!);


                                // Get.find<Database>().storeList(Get.find<Database>().restoreList()!);
                                print(
                                    "qqqqqqqqqqqqqqqqqq2222222222222222222222222222222");
                                FavouriteController.of(context)
                                    .favs
                                    .removeWhere((element) => element.id!);
                                print(widget.id!);
                                print("qqqqqqqqqqqqqqqqqqqqqq");
                                FavouriteController.of(context)
                                    .emit(FavouriteIntial());
                              }

                              // FavouriteController.of(context)..addToFav(widget.id!);
                              setState(() {
                                // widget.function;
                                isLike = !isLike;
                                // RealTimeController.of(context).ADD(
                                //     widget.name!, widget.price, widget.image!, "");
                              });
                            });
                      },
                    ),
                  ),
                ],
              )),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
//                  Icon(Test2.group__1,
//                     size: 50,color: Color(0xff0f387d),),
