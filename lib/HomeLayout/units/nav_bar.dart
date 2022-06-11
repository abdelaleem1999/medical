import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:medicia/HomeLayout/cubit.dart';



class NavBar extends StatelessWidget {
  @override
  final  List<String> q=["home","ass","aaaa","aaa"];
  Widget build(BuildContext context) {
    final cubit = HomeLayoutCubit.of(context);
     return GNav(
       rippleColor: Colors.indigo[300]!,
       hoverColor: Colors.cyan[100]!,
       gap: 8,
       activeColor: Color(0xfd285d7d),
       iconSize: 30,
       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
       duration: Duration(milliseconds: 400),
       tabBackgroundColor: Color(0xfddadfe3),
       color: Color(0xfd939597),

       tabs:
         cubit.screens
               .map((e) => GButton(icon: e[0],text: e[2]))
               .toList(),

       selectedIndex:  cubit.currentIndex,
       onTabChange: cubit.changeIndex,
         );





    // CurvedNavigationBar(
    //   index: cubit.currentIndex,
    //   height: 45,
    //   backgroundColor: Colors.cyan,
    //   items: cubit.screens
    //       .map((e) => Icon(e[0], size: 25, color: Colors.grey))
    //       .toList(),
    //   onTap: cubit.changeIndex,
    // );
  }
}
