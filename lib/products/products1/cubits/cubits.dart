
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/getStorage.dart';
import 'package:medicia/helper/firebase_realtime_helper.dart';
import 'package:medicia/products/products1/models/models.dart';
import 'package:medicia/products/products1/states/states.dart';

class RealTimeController extends Cubit<ProductsStates> {
  RealTimeController() : super(ProductsIntial());

  List<HomeModels> models = [];
  List <dynamic> imageS=[
    "assets/images/medicia/WhatsApp Image 2021-12-28 at 11.02.42 PM.jpeg",
    "assets/images/medicia/2.jpeg",
    "assets/images/medicia/3.jpeg",
    "assets/images/medicia/4.jpeg",
    "assets/images/medicia/5.jpeg",
    "assets/images/medicia/6.jpeg",
    "assets/images/medicia/7.jpeg",

  ];



  static RealTimeController of(context) => BlocProvider.of(context);
  static final _ref =FirebaseDatabase.instance.reference().child('product');
 late final HomeModels? homeModels;
 late final String?x;
  final List<List<dynamic>>? Adds=[

  ];
  // final box = GetStorage();



 void remove(){
   FirebaseRealtimeHelper.deleteData().onData((data) {
     print("item removed from database");
     var model =HomeModels.fromJson(data.snapshot.value as Map<dynamic, dynamic>);
     models.removeWhere((element) => element.id==model.id);
     emit(state);
   });
 }
 void get()
 {
   FirebaseRealtimeHelper.getData().onData((data) {
     // print(data.snapshot.value);
     models.add(HomeModels.fromJson(data.snapshot.value as Map<dynamic, dynamic>));
     // print(data.snapshot.value);
     emit(ProductItemAddedState());
   });
 }
  ADD(String x, dynamic y , String z,String m){
   if(!(Adds!.any((List l) => l[0]==x))){

     Adds!.add([x,y,z,m]);
     print("0000000000000000000000000000000000000000000");
     Get.find<Database>().storeList(Adds!);

   }else{

   }


   // box.write('key', Adds);
   // print(box.read('key'));
   print("1111111111111111111111111111111111");


   // SharedHelper.setIfav(Adds!);

   print(Adds);





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