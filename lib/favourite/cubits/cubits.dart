import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/favourite/models/models.dart';
import 'package:medicia/favourite/states/states.dart';
import 'package:medicia/helper/firebase_realtime_helper.dart';
import 'package:medicia/products/products1/models/models.dart';

class FavouriteController extends Cubit<FavouriteStates> {


  FavouriteController() : super(FavouriteIntial());
  late final String? a;
  late final String? b;
late final Widget? value;
late final int? index;
  List<HomeModels> models = [];
  List <dynamic> favs=[

  ];

  static FavouriteController of(context) => BlocProvider.of(context);



 void remove(){
   FirebaseRealtimeHelper.deleteData().onData((data) {
     print("item removed from database");
     var model =HomeModels.fromJson(data.snapshot.value as Map<dynamic, dynamic>);
     models.removeWhere((element) => element.id==model.id);
     emit(state);
   });
 }
 void addToFav(int index)
 {
   FirebaseRealtimeHelper.addData().onData((data) {
     print("item removed from database");
     var model =FavModels.fromJson(data.snapshot.value as Map<dynamic, dynamic>);
     favs.add((element) => element.index==model.id);
     emit(state);
   });
     // print(data.snapshot.value);
     // favs.add(value!);
   }
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