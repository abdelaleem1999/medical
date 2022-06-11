import 'dart:async';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/helper/firebase_realtime_helper.dart';
import 'package:medicia/products/products1/models/models.dart';
import 'package:medicia/products/products1/states/states.dart';
import 'package:medicia/products/products2/models/models.dart';
import 'package:medicia/products/products2/states/states.dart';

class RealTimeController2 extends Cubit<ProductsStates2> {
  RealTimeController2() : super(ProductsIntial2());

  List<HomeModels2> models = [];
  List <dynamic> imageS=[
    "assets/images/medicia/2.1.jpeg",
    "assets/images/medicia/2.2.jpeg",
    "assets/images/medicia/2.3.jpeg",
    "assets/images/medicia/2.4.jpeg",
    "assets/images/medicia/2.5.jpeg",
    "assets/images/medicia/2.6.jpeg",
    "assets/images/medicia/2.7.jpeg",

  ];



  static RealTimeController2 of(context) => BlocProvider.of(context);
  static final _ref =FirebaseDatabase.instance.reference().child('product2');
  HomeModels2? homeModels2;
 late final String?x;



 void remove(){
   FirebaseRealtimeHelper.deleteData().onData((data) {
     print("item removed from database");
     var model =HomeModels2.fromJson(data.snapshot.value as Map<dynamic, dynamic>);
     models.removeWhere((element) => element.id==model.id);
     emit(state);
   });
 }
 void get()
 {
   FirebaseRealtimeHelper.getData2().onData((data) {
     // print(data.snapshot.value);
     models.add(HomeModels2.fromJson(data.snapshot.value as Map<dynamic, dynamic>));
     // print(data.snapshot.value);
     emit(ProductItemAddedState2());
   });
 }
  //   StreamSubscription<DatabaseEvent> getData(){
  //     emit(ProductsLoading());
  //
  //   final steram=_ref.onChildAdded;
  //
  //   return steram.listen((event) {
  //     print(event.snapshot.value);
  //     print(JsonEncoder().convert(event.snapshot.value)+"aaaaaaaaaaaaaaaaaaaaaa1233");
  //
  //     homeModels= HomeModels.fromJson(event.snapshot.value as dynamic);
  //     emit(ProductsIntial());
  //   });
  //
  // }

}
// class DioHelper {
//
//   static final _baseUrl = "https://student.valuxapps.com/api/products?category_id=1";
//
//   static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;
//
//   static Future<Response<dynamic>> post(String path,{Map<String, dynamic>? body}){
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'apitoken': currentLoggedUser.apiToken,
//     };
//     final response = dioSingleton.post(path,data: FormData.fromMap(body!));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> get(String path){
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'apitoken': currentLoggedUser.apiToken,
//     };
//     final response = dioSingleton.get(path);
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> patch(String path,{Map<String, dynamic> body}){
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'apitoken': currentLoggedUser.apiToken,
//     };
//     final response = dioSingleton.patch(path,data: FormData.fromMap(body));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> put(String path,{Map<String, dynamic> body,dynamic formData}){
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'secret': 'FtAdHjYgA2dtujT9civRD7BRZuZRZqSCQhZMeHlAsT',
//     };
//     final response = dioSingleton.put(path,data: formData != null ? formData : FormData.fromMap(body));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> delete(String path,{Map<String, dynamic> body}){
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'apitoken': currentLoggedUser.apiToken,
//     };
//     final response = dioSingleton.delete(path,data: FormData.fromMap(body));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
// }