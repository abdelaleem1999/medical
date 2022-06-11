import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:medicia/cart/states/states.dart';
import 'package:medicia/getStorage.dart';
import 'package:medicia/products/products1/models/models.dart';

class CartsController extends Cubit<CartsStates> {


  CartsController() : super(CartsIntial());

 late final  int? Index;
   int? S=0;
   late final List<int>? lists=[];

 late final List<List<dynamic>>? Adds=[

  ];
  late final List<List<dynamic>>? Not=[

  ];
  int counter = 1;
  HomeModels? homeModels;

  static CartsController of(context) => BlocProvider.of(context);




  add(){
    counter++;
    // emit(CounterRebuild());
  }
  void subtract(){
    if(counter>1) {
      counter--;
    }else{

    }
    // emit(CounterRebuild());
  }



  AddToCarts(String x, dynamic y , String z,String m){
    if(!(Adds!.any((List l) => l[0]==x))){
      Adds!.add([x,y,z,m]);
      Get.find<Database>().storeListCarts(Adds!);

    }else{

    }

    // Not.add([x,y,z,m]);

   // total=int.parse(Adds[i][1]) ;
   // print(total);

    print(Adds);

  }
  AddToNot(){
    print("ooooooooooooooooooooooooooooooooooooooooooooooo");
    Not!.addAll(Adds!);
    print("11111111111111111111111111111111111111111111111");
    Get.find<Database>().storeListNotification(Not!);
    print("22222222222222222222222222222222222222222222");

    // print(Not![0][0]+"1111111111111111111111111111111111111");
    print(Not);
    print("3333333333333333333333333333333333333333333333333333");
   // total=int.parse(Adds[i][1]) ;
   // print(total);

    print(Adds);

  }
  // AddToSum(int s){
  //   lists!.add(s);
  //     // S!=S!+s as int;
  //     print(lists!);
  //
  //
  //
  // }

  // removeCart(int index){
  //   print("111111111111111111111111111111111");
  //   Adds!.remove(index);
  //   print(Adds!);
  // }


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