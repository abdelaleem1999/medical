import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/cart/cubits/cubits.dart';
import 'package:medicia/notifications/notificationBody.dart';

import '../getStorage.dart';

class NotificationsView extends StatefulWidget {

  @override
  _NotificationsViewState createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text("الاشعارات",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),

        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.angleRight, size: 25, color: Colors.black,)),

      ),

      body: SafeArea(
        child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [

                  BlocBuilder(
                    bloc: CartsController.of(context),
                    builder: (context, state) {
                      if(Get.find<Database>().restoreListNotification()==null
                          || Get.find<Database>().restoreListNotification()!.isEmpty){
                        return Text("لا يوجد طلبات سابقه  ");

                      }
                      else{
                        return ListView.builder(
                          itemCount: Get.find<Database>().restoreListNotification()!.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),

                          scrollDirection:Axis.vertical ,
                          itemBuilder: (context, index) => InkWell(
                              onTap: (){

                              },
                              child: NotificationBody(
                                name: Get.find<Database>().restoreListNotification()![index][0],
                                image: Get.find<Database>().restoreListNotification()![index][2],
                              )
                            // Column(
                            //   children: [
                            //     Image.asset(RealTimeController.of(context).Adds[index][2]),
                            //   ],
                            // ),
                          ),
                        );

                      }

                    },
                  ),
                ],
              ) ,

            ] ),
      ),
    );
  }
}
