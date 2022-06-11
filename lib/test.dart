// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:textmatemd/products/cubits/cubits.dart';
// import 'package:textmatemd/products/states/states.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//
//
// import 'helper/firebase_realtime_helper.dart';
//
// class Tests extends StatefulWidget {
//   @override
//   _TestsState createState() => _TestsState();
// }
//
// class _TestsState extends State<Tests> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder(
//       bloc: RealTimeController.of(context),
//       builder: (context, state) {
//         final controller = RealTimeController.of(context);
//
//         return Scaffold(
//             body: ListView.builder(
//                 itemCount: controller.models.length,
//                 itemBuilder: (context, index) =>
//                     Column(
//                       children: [
//                         Text(controller.models[index].name!),
//                         Text(controller.models[index].descraption!),
//                         Image.asset(controller.imageS[index]),
//                         // Image.network(
//                         //     controller.models[index].image!),
//
//                       ],
//                     )));
//       },
//     );
//   }
// }
