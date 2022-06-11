import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicia/HomeLayout/view.dart';
import 'package:medicia/core/shared_helper.dart';
import 'package:medicia/login/view.dart';
import 'package:medicia/pageView/pageViews.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SharedHelper.getToken==null||SharedHelper.getToken==""?PageViewDemo():HomeLayout(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        // Color(0xf5f6f6),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Text("Medicia",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
              Image.asset("assets/images/Group 1.png") ,

            ],
          ),
        )



    );
  }
}
// Icon(
// Icons.personal_video_sharp,
// size: 300,
// color: Colors.blue,
// ),
