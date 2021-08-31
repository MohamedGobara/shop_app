import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/const/methods.dart';
import 'package:shop_app/cubit_login/login_cubit.dart';
import 'package:shop_app/cubit_login/login_states.dart';
import 'package:shop_app/screens/login.dart';


class signup extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<signup> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  var usernamecontroller = TextEditingController();
  var myformkey = GlobalKey<FormState>();
  bool isvisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => login_cubit(),
      child: BlocConsumer<login_cubit, login_states>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: myformkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 110,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "تسجيل حساب جديد",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                        SizedBox(
                          height: 15,
                        )
                        ,
                        TextFormField(
                          controller: usernamecontroller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "user must not be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: "ادخل اسمك",
                            labelText: "الإسم",
                            border: OutlineInputBorder(),


                          ),
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
                            hintText: "أدخل االبريد الإلكتروني الخاص بك",
                            labelText: "البريد الإلكتروني",
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
                              hintText: "أدخل كلة المرور",
                              labelText: "كلمة المرور",
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
                          height: 15,
                        ),

                        TextFormField(
                          controller: phonecontroller,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "phone must not be empty";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            hintText: "أدخل رقم الهاتف الخاص بك",
                            labelText: "الهاتف",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: OutlinedButton.icon(
                              onPressed: () async {
                                if (myformkey.currentState.validate()) {
                                  login_cubit.get(context).signup(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text ,
                                      phone:  phonecontroller.text,
                                      username:  usernamecontroller.text,

                                  );
                                }
                              },
                              icon: Icon(Icons.login_outlined),
                              label: Text("تسجيل حساب جديد"),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    navpushreplas(login(), context);
                                  },
                                  child: Text("أمتلك حساب بالفعل")),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
