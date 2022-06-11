import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicia/login/view.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  static late int x = 0;

  final PageController _controller = PageController(
    initialPage: x,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PageController _controller = PageController(
      initialPage: x,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: PageView(
            physics:NeverScrollableScrollPhysics() ,
            controller: _controller,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 80, right: 15.0, left: 15, bottom: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset("assets/images/Group 837.png"),
                      ),
                    ),
                    Text(
                      "توفير خدمات العلاج ",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "توفير خدمات العلاج في فرنسا وسويسرا وبلجيكا واسبانيا بالاضافه الي المانياوبرطانيا وامريكا ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w100,
                          color: Color(0x61111118)),
                    ),
                    Container(
                      child: Image.asset("assets/images/Group 838.png"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));

                          }, child: Text("تخطي")),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff1063a5)),
                              ),
                              onPressed: () {
                                if (_controller.hasClients && x <= 2) {
                                  _controller.animateToPage(
                                    x++,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                } else if (x > 2) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginView()));
                                }
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "التالي",
                                    ),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 80, right: 15.0, left: 15, bottom: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset("assets/images/Group 836.png"),
                      ),
                    ),
                    Text(
                      "خدمه 24 ساعه",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "دورنا الاساسي تقديم افضل وأفضل وأسرع الخدمات والأرشادات التي يمكن ان يحتاجها المريض قبل وخلال سفره وحتي بعد عودنه",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Color(0x61242432)),
                    ),
                    Container(
                      child: Image.asset("assets/images/Group 839.png"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));

                          }, child: Text("تخطي")),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff1063a5)),
                              ),
                              onPressed: () {
                                if (_controller.hasClients && x <= 2) {
                                  _controller.animateToPage(
                                    x++,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                } else if (x > 2) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginView()));
                                }
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "التالي",
                                    ),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 80, right: 15.0, left: 15, bottom: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset("assets/images/Group 835.png"),
                      ),
                    ),
                    Text(
                      "فريق عمل ذو خبره",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "تم اختيار فريق عمل ميدكيا بعناية كبيرة فهو مؤلف من مجموعه من المختصين وذو خبره عاليه",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Color(0x61242432)),
                    ),
                    Container(
                      child: Image.asset("assets/images/Group 8392.png"),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff1063a5)),
                              ),
                              onPressed: () {
                                if (_controller.hasClients && x <= 2) {
                                  _controller.animateToPage(
                                    x++,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                } else if (x > 2) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginView()));
                                }
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "البدء",
                                    ),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

f(int x) {
  x = 0;

  x++;
}
