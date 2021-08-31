import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/const/myconst.dart';
import 'package:shop_app/cubit_login/login_cubit.dart';
import 'package:shop_app/cubit_login/login_states.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/shared/shared_pre.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  TextEditingController email_controller = TextEditingController();

  var name_controller = TextEditingController();

  var phone_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => login_cubit()..loginModel,
      child: BlocConsumer<login_cubit, login_states>(
        listener: (context, states) async {},
        builder: (context, states) {
          // email_controller.text = states_cubit.get(context).mydata["data"]["email"].toString() ;
          // phone_controller.text = states_cubit.get(context).mydata["data"]["phone"].toString() ;
          //
          // name_controller.text = states_cubit.get(context).mydata["data"]["name"].toString() ;

          if (CachHelper.getData(key: "email") != null) {
            email_controller.text = CachHelper.getData(key: "email");
          }

          phone_controller.text = CachHelper.getData(key: "phone");

          name_controller.text = CachHelper.getData(key: "name");

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
              elevation: 0,
              title: Text(
                "الإعدادات",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: name_controller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "أدخل الإسم الخاص بك",
                      labelText: "الإسم",
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phone_controller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "أدخل رقم الهاتف الخاص بك",
                      labelText: "رقم الهاتف",
                      border: OutlineInputBorder(),
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: email_controller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "أدخل الإيميل الخاص بيك",
                      labelText: "الإيميل",
                      border: OutlineInputBorder(),
                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        label: Text(
                          "تحديث البيانات",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => login()));
                          const_token = "";

                          CachHelper.romoveData(key: "email ");
                          const_email = "";
                          CachHelper.romoveData(key: "name ");
                          const_name = "";
                          CachHelper.romoveData(key: "phone ");
                          const_phone = "";
                          CachHelper.romoveData(key: "token ");
                          const_token = "";

                        CachHelper.romoveData(key: "islogin");


                          CachHelper.setData(key: "islogin", value: false)
                              .then((value) {
                            print("تم تسجيل الخر,ج بنجاح");
                          });
                        },
                        icon: Icon(Icons.logout),
                        label: Text(
                          "تسجيل لخروج",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
