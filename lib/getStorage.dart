import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Database  extends GetxController {

  final box = GetStorage();
  Future<void> initStorage() async {
    await GetStorage.init();
  }
   void storeList(List list)  {
     box.write('model', list);
  }
  List? restoreList() {
    final list = box.read('model') ;
    return list;
  }


  void storeListCarts(List list)  {
    box.write('carts', list);
  }
  List? restoreListCarts() {
    final list = box.read('carts') ;
    return list;
  }


  void storeListNotification(List list)  {
    box.write('not', list);
  }
  List? restoreListNotification() {
    final list = box.read('not') ;
    return list;
  }




  void storeName(TextEditingController tex)  {
    box.write('tex', tex);
  }
  TextEditingController? restoreName() {
    final tex = box.read('not') ;
    return tex;
  }



}

