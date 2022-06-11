import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/editProfile/states/states.dart';


class AddressDetailsController extends Cubit<AddressDetailsStates>{
  AddressDetailsController() : super(AddressDetailsIntial());
  static AddressDetailsController of (context) =>BlocProvider.of(context);
   String? numbers;
   String? nameds;
  late final TextEditingController nameController=TextEditingController();
  late final TextEditingController numberController=TextEditingController();


  SaveAddressDetails(String named,String number) async{
    emit(AddressDetailsLoading());

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
   await FirebaseFirestore.instance
        .collection('users')
        .doc(named)
        .set({
      'named': named,
      'age': '25',
      'namber': number,
      'phone': '0000000000000000000000000000000100000000001',
    });
    nameController.text=named;

    numberController.text=number;

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

    emit(AddressDetailsIntial());
  }


}