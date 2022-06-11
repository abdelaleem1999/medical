import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/core/shared_helper.dart';
import 'package:medicia/editProfile/editProfileView.dart';
import 'package:medicia/login/view.dart';
import 'package:medicia/setting/widgets/settingComponentRow.dart';
import 'package:url_launcher/url_launcher.dart';

import '../getStorage.dart';

class SettingView extends StatefulWidget {

  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
TextEditingController? x=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xfd214b97),
        title: Center(child: Text("المزيد")),
      ),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileView()));
              },
              child: SettingComponentRow(
                icon: FontAwesomeIcons.user,
                icon2: FontAwesomeIcons.angleLeft,
                name:"الملف الشخصي" ,
              ),
            ),
            // Divider(),
            // SettingComponentRow(
            //   icon: FontAwesomeIcons.cog,
            //   icon2: FontAwesomeIcons.angleLeft,
            //   name:"الاعدادت" ,
            // ),
            // Divider(),
            // SettingComponentRow(
            //   icon: FontAwesomeIcons.checkCircle,
            //   icon2: FontAwesomeIcons.angleLeft,
            //   name:" التأمين الصحي" ,
            // ),
            // Divider(),
            // SettingComponentRow(
            //   icon: FontAwesomeIcons.infoCircle,
            //   icon2: FontAwesomeIcons.angleLeft,
            //   name:"عن ميدكيا" ,
            // ),
            Divider(),
            InkWell(
              onTap:()async{
                await launch('tel:0144455574'


                );
                },
              child: SettingComponentRow(
                icon: FontAwesomeIcons.phoneAlt,
                icon2: FontAwesomeIcons.angleLeft,
                name:"اتصل بنا" ,

              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginView()));
                // Get.find<Database>().storeName(x);

                SharedHelper.setToken("");
                print(SharedHelper.isLogged);
                print(SharedHelper.getToken);
                print("1111111111111111111111111111111111");

                  if(Get.find<Database>().restoreList()==null
                  ||Get.find<Database>().restoreList()!.isEmpty){

                  }else{
                    Get.find<Database>().restoreList()!.clear();

                  }
                  if(Get.find<Database>().restoreListCarts()==null
                      ||Get.find<Database>().restoreListCarts()!.isEmpty){

                  }else{
                    Get.find<Database>().restoreListCarts()!.clear();
                  }
                  if( Get.find<Database>().restoreListNotification()==null
                      ||Get.find<Database>().restoreListNotification()!.isEmpty){

                  }else{
                    Get.find<Database>().restoreListNotification()!.clear();
                  }


                // Get.find<Database>().restoreListNotification()!.clear();
                // SharedHelper.setId(y!);
                //  SharedHelper.setEmail(z!);
                print(SharedHelper.getToken);

              },
              child: SettingComponentRow(
                icon: FontAwesomeIcons.signOutAlt,
                icon2: FontAwesomeIcons.angleLeft,
                name:"خروج" ,
              ),
            ),








//admin_panel_settings_rounded
          ],
        ),
      ),
    );
  }
}
