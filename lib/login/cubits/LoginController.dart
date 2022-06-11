
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/core/shared_helper.dart';
import 'package:medicia/login/states/states.dart';


class LoginController extends Cubit<LoginStates> {
  LoginController() : super(LoginIntial());

  static LoginController of (context) =>BlocProvider.of(context);
  late final TextEditingController emailController=TextEditingController();



  Future<String> login(String email , String password)async{
    emit(LoginLoading());
    final response =await Dio().post(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDAgxgw-CMuOwOmLWGSkTviD6ZagVk5H48',
     data:jsonEncode({'email':email ,'password':password,
       'returnSecureToken': true,

     }),
        options: Options(validateStatus: (status) {
          return status! < 500;
        })
     );


    emailController.text=email;

    final data =response.data as Map;


    if (data.containsValue(true)) {
      print(data);
      await SharedHelper.setToken(data['idToken']);
      await SharedHelper.setId(data['localId']);
      await SharedHelper.setEmail(data['email']);

      return 'ok';
    } else if (data.toString().contains('INVALID_PASSWORD')){
      return 'كلمه المرور غير صحيحه';

    }else if (data.toString().contains('INVALID_EMAIL')){
      return 'البريد الالكتروني غير موجود';

    }
    else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
  Future<String> getItems()async{
    emit(LoginLoading());
    final response =await Dio().get(

       'https://shop-app-dcff6.firebaseio.com/users.json',

        options: Options(validateStatus: (status) {
          return status! < 500;
        })
     );

    final data =response.data as Map;
    if (data.containsValue(true)) {
      return 'ok';
    } else if (data.toString().contains('INVALID_PASSWORD')){
      return 'كلمه المرور غير صحيحه';

    }else if (data.toString().contains('INVALID_EMAIL')){
      return 'البريد الالكتروني غير موجود';

    }
    else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
  Future<String> posts()async{
    emit(LoginLoading());
    final response =await Dio().post(
      'https://testqqqq-13ccf.firebaseio.com/app.json',
        data:{"namedddddddddddddddddddddd":"facebook"},


        options: Options(validateStatus: (status) {
          return status! < 500;
        })
     );

    final data =response.data as Map;
    if (data.containsValue(true)) {
      return 'ok';
    } else if (data.toString().contains('INVALID_PASSWORD')){
      return 'كلمه المرور غير صحيحه';

    }else if (data.toString().contains('INVALID_EMAIL')){
      return 'البريد الالكتروني غير موجود';

    }
    else
      emit(LoginIntial());
    print(data);

    return '>>>>error>>>>';



  }
  Future <void>PutItems() async{
   await FirebaseFirestore.instance
        .collection('users')
        .doc('jack')
        .set({
      'named': 'Aabdelaleems',
      'age':'25',
      'namber':'1',
      'phone':'0100000000001000',
    });
  }
  Future <void> LogOut()async{

  }

 }