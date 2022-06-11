import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicia/HomeLayout/states.dart';
import 'package:medicia/cart/cartsView.dart';
import 'package:medicia/favourite/favouriteView.dart';
import 'package:medicia/header_icons.dart';
import 'package:medicia/home/view.dart';
import 'package:medicia/notifications/notificationsView.dart';
import 'package:medicia/setting/settingView.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInit());

  static HomeLayoutCubit of(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<List<dynamic>> screens = [
    [Header.home, HomeView(), "الرئسية"],
    [Header.database, NotificationsView(), "الاشعارات"],
    [Header.heart, FavouriteView(), "المفضلة"],
    [Header.cog, SettingView(), "المزيد"],
  ];

  void changeIndex(int value) {
    if (currentIndex == value) return;
    currentIndex = value;
    emit(HomeLayoutInit());
  }

  Widget get getCurrentView => screens[currentIndex][1];
}
