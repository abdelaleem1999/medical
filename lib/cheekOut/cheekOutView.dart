import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicia/contactUs/contactUsView.dart';
import 'package:medicia/login/widgets/signButton.dart';
import 'package:medicia/widgets/appBar.dart';

class CheekOutView extends StatefulWidget {
  CheekOutView({this.sum});
  late final int? sum;

  @override
  _CheekOutViewState createState() => _CheekOutViewState();
}

class _CheekOutViewState extends State<CheekOutView> {
  int? selectedRadioTile;

  void initState() {
    super.initState();
    selectedRadioTile = 0;
  }

  setSelectedColorRadio(int? val) {
    setState(() {
      selectedRadioTile = val!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text("تفاصيل الدفع",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),

          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);

          },
              icon: Icon(
                FontAwesomeIcons.angleRight, size: 25, color: Colors.black,)),
        ),


        body: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
          child: ListView(
            children: [
              Text("الدفع من خلال",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressView()));

                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),

                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(7),

                          border: Border.all(color: Colors.grey)
                      ),
                      child: RadioListTile(
                        value: 1,
                        groupValue: selectedRadioTile,
                        title: Text('Credit Card'),
                        secondary: Image.asset("assets/images/medicia/CreditCard.jpg"),

                        //  selected:true,
                        onChanged: (int? val) {
                          setSelectedColorRadio(val!);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Logi()));

                        },
                        activeColor: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),

                        border: Border.all(color: Colors.grey)
                    ),

                    child: RadioListTile(
                      value: 2,

                      // selected:false ,
                        secondary: Image.asset("assets/images/medicia/img_2.png",
                        fit: BoxFit.fill,
                        height: 25,),

        groupValue: selectedRadioTile,
                      activeColor: Colors.red,
                      title: Text('Visa'),
                      onChanged: (int? value) {
                        setSelectedColorRadio(value!);

                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),

                        border: Border.all(color: Colors.grey)
                    ),

                    child: RadioListTile(
                      value: 3,
                      secondary: Image.asset("assets/images/medicia/img_4.png"),

                      // selected:false ,
                      groupValue: selectedRadioTile,
                      activeColor: Colors.red,
                      title: Text('Paypal'),
                      onChanged: (int? value) {
                        setSelectedColorRadio(value!);

                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),

                        border: Border.all(color: Colors.grey)
                    ),

                    child: RadioListTile(
                      value: 4,
                      secondary: Image.asset("assets/images/medicia/img_5.png"),

                      // selected:false ,
                      groupValue: selectedRadioTile,
                      activeColor: Colors.red,
                      title: Text('ebay'),
                      onChanged: (int? value) {
                        setSelectedColorRadio(value!);

                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),

                        border: Border.all(color: Colors.grey)
                    ),

                    child: RadioListTile(
                      value: 5,

                      // selected:false ,
                      groupValue: selectedRadioTile,
                      activeColor: Colors.red,
                      title: Text('cash'),
                      onChanged: (int? value) {
                        setSelectedColorRadio(value!);

                      },
                    ),
                  ),
                ],
              ),
              Text("الحساب الكلي",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              Container(
                height: MediaQuery.of(context).size.height/14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Color(0xffbfc2c4) , blurRadius: 2)],
                  color: Colors.white70,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("مكونات الطلب",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text(widget.sum!.toString(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("تكلفه التوصيل",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  Text("10",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Color(0xffbfc2c4) , blurRadius: 2)],
                  color: Colors.white70,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("الحساب الكلي",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text((widget.sum!+10).toString(),
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),



            ],
          ),
        ),
        bottomNavigationBar:InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUsView()));
          },

          child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SignButton(
            name:"استمرار" ,
            c:Color(0xff0c558b) ,
          ),
          ),
        ) ,

      ),
    );
  }
}
