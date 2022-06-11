import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/HomeLayout/cubit.dart';
import 'package:medicia/HomeLayout/states.dart';
import 'package:medicia/HomeLayout/units/nav_bar.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutStates>(
        builder: (context, state) => Scaffold(

          bottomNavigationBar: NavBar(),
          body: HomeLayoutCubit.of(context).getCurrentView,

        ),
      ),
    );
  }
}

