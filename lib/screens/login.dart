import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/const/myconst.dart';
import 'package:shop_app/cubit_login/login_cubit.dart';
import 'package:shop_app/cubit_login/login_states.dart';
import 'package:shop_app/screens/layout.dart';
import 'package:shop_app/shared/shared_pre.dart';

class login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<login> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();
  var myformkey = GlobalKey<FormState>();
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => login_cubit(),
      child: BlocConsumer<login_cubit, login_states>(
        listener: (context, states) {
          if (states is successgetpost) {
            if (states.loginModel.status == true) {
              //go to home screen
              print(states.loginModel.message);
              print(states.loginModel.data.token);
              Fluttertoast.showToast(
                  msg: "${states.loginModel.message}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 17.0);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => layout()));
            } else {
              print(states.loginModel.message);
              Fluttertoast.showToast(
                  msg: "${states.loginModel.message}",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 30.0);
            }
          }
        },
        builder: (context, states) {
          return Scaffold(
              body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: myformkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  // Text(
                  //   "الدخول",
                  //   style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "ادخل لحسابك دلوقتي ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: emailcontroller,
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
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password must not be empty";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.security),
                        hintText: "أدخل الباسورد الخاص بيك",
                        labelText: "الباسورد",
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: isvisible
                              ? Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black45,
                                )
                              : Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.deepOrangeAccent,
                                ),
                          onPressed: () {
                            setState(() {
                              isvisible = !isvisible;
                            });
                          },
                        )),
                    obscureText: isvisible,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: OutlinedButton.icon(
                        onPressed: () async {
                          if (myformkey.currentState.validate()) {
                            login_cubit.get(context).signin(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
                          }
                        },
                        icon: Icon(Icons.login_outlined),
                        label: Text("تسجيل الدخول"),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text("ممكن تسجل واحد جديد دلوقتي   ")),
                        Text("معندكش اكونت ؟"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
