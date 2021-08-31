import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/API/shop_login_model.dart';
import 'package:shop_app/const/myconst.dart';
import 'package:shop_app/cubit_login/login_states.dart';
import 'package:shop_app/dio_helpers/dio.dart';
import 'package:shop_app/shared/shared_pre.dart';

class login_cubit extends Cubit<login_states> {
  login_cubit() : super(initializedstates());

  Map<String, dynamic> mydata;

  static login_cubit get(context) => BlocProvider.of(context);

  shopLoginModel loginModel;


  void signin({@required String email, @required String password , context}) {
    print("getdata...");
    emit(withinggetpost());
    dio_helpers.postData(
        url: "login",
        data: {"email": email, "password": password}).then((value) async{
      mydata = value.data;
      //print(value.data);

      loginModel = shopLoginModel.fromJson(mydata);
      const_name= loginModel.data.name ;
      const_phone = loginModel.data.phone ;
      const_email = loginModel.data.email ;
      const_token = loginModel.data.token ;

      await CachHelper.setData(
          key: "email",
          value: const_email)
          .then((value) {
        print("email saved");
      });


      await CachHelper.setData(
          key: "name",
          value: const_name)
          .then((value) {
        print("name saved");
      });

      await CachHelper.setData(
          key: "phone",
          value: const_phone)
          .then((value) {
        print("phone saved");
      });




      await CachHelper.setData(
          key: "token",
          value: const_token)
          .then((value) {
        print("token saved");
      });

      await CachHelper.setData(
          key: "islogin", value: true)
          .then((value) {
        print("is_login saved");
      });





      emit(successgetpost(loginModel));

      return value.data;
    }).catchError((error) {
      print(error.toString());
      emit(errorgetpost());
    });
  }
}
