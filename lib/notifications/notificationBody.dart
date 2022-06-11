import 'package:flutter/material.dart';

class NotificationBody extends StatefulWidget {
  NotificationBody(
      {this.image,
        this.name,
       });
  final String? image;
  final String? name;


  @override
  _NotificationBodyState createState() => _NotificationBodyState();
}

class _NotificationBodyState extends State<NotificationBody> {
  @override
  Widget build(BuildContext context) {
        return Column(
          children: [
            Container(
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(color: Color(0xffdce9fa), blurRadius: 0)
                          ],
                          //0xfde2eff3
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              widget.image!,
                              fit: BoxFit.fill,
                              height: 55,
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name!,
                            style: TextStyle(
                              color: Color(0xF8898B8E),
                            ),
                          ),
                          // Text("ترمومتر للحراره",style:TextStyle(
                          //   color: Color(0x3c424c4e),
                          // ) ,),
                          Text(" طلبك قيد المراجعه ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                )),
            Divider(),
          ],
        );


  }
}
