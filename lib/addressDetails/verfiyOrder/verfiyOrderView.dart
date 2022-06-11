import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/HomeLayout/view.dart';
import 'package:medicia/login/widgets/signButton.dart';

import '../../getStorage.dart';

class VerfiyOrderView extends StatefulWidget {

  @override
  _VerfiyOrderViewState createState() => _VerfiyOrderViewState();
}

class _VerfiyOrderViewState extends State<VerfiyOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(
            top: 130, right: 15.0, left: 15, bottom: 10),
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/medicia/Group 802.png"),
            ),
            Text(
              "تم ارسال طلبك بنجاح",
              style:
              TextStyle(fontSize: 23, fontWeight: FontWeight.bold,
                  color: Color(0xFF093D68)
              ),
            ),
            Text(
              "تم ارسال طلبك بنجاح وستتلقي رساله تـأكيد قريبأ",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7CA5C6)),
            ),
            Spacer(),

            InkWell(
              onTap: (){
                if(Get.find<Database>().restoreListCarts()==null
                    ||Get.find<Database>().restoreListCarts()!.isEmpty){

                }else{
                  Get.find<Database>().restoreListCarts()!.clear();
                }
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeLayout()));
              },
              child: SignButton(
                name: "العوده للصفحه الرئيسيه",
                c:  Color(0xFF093D68),
              ),
            )
          ],
        ),
      ),
    );
  }
}
