import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/core/shared_helper.dart';
import 'package:medicia/signup/states/states.dart';
class SignUpController extends Cubit<SignUpStates> {

  SignUpController() : super(SignUpIntial());
 static SignUpController of (context) =>BlocProvider.of(context);


  Future <String?> signUp(String email, String password ,
      // String name ,String phone
      )async{
    emit(SignUpLoading());
    final response= await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDAgxgw-CMuOwOmLWGSkTviD6ZagVk5H48',
        data:jsonEncode({'email':email ,'password':password,
          'returnSecureToken': true,

        }),
        options: Options(validateStatus: (status) {
          return status! < 500;
        })
    );
    print(response.data);

    print('='*8);
    final data =response.data as Map;
    //////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////

    // print('omaar, $data');
    if (data.containsKey('idToken')) {
      await  SharedHelper.setToken(data['idToken']);
      await  SharedHelper.setId(data['localId']);
      await SharedHelper.setEmail(data['email']);

      print(data);
      return 'ok';
    } else{
      emit(SignUpIntial());
      print(data);

      return 'البريد الالكتروني خطأ';

    }
      // emit(SignUpIntial());




  }
}