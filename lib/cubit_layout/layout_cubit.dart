import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/API/fav_model.dart';
import 'package:shop_app/API/products_model.dart';
import 'package:shop_app/API/shop_login_model.dart';
import 'package:shop_app/const/myconst.dart';
import 'package:shop_app/cubit_layout/layout_states.dart';
import 'package:shop_app/dio_helpers/dio.dart';
import 'package:shop_app/screens/categories.dart';
import 'package:shop_app/screens/favorites.dart';
import 'package:shop_app/screens/products_home.dart';
import 'package:shop_app/screens/setting.dart';

class layout_cubit extends Cubit<layout_states> {
  layout_cubit() : super(layoutinitialState());

  static layout_cubit get(context) => BlocProvider.of(context);
  int index = 0;

  List screens = [products_home(), catagories(), favorites(), setting()];
  products_model productmodel;
  var mtlayaout_data;

  List mylayout_banners;

  List<dynamic> mylayout_products = [];
  bool status;

  Map<int, bool> myfav = {};

  void initlist() {
    mylayout_products = [];
  }

  void getProductsData() async {
    print("get data...");
    emit(getdatalayoutloading());
    await dio_helpers.getData(url: "home").then((value) {
      //  print(value.data.toString());
      status = value.data["status"];
      mtlayaout_data = value.data["data"];
      mylayout_banners = value.data["data"]["banners"];

      mylayout_products = value.data["data"]["products"];

      mylayout_products.forEach((element) {
        myfav.addAll({element["id"]: element["in_favorites"]});
      });

      print(myfav.toString());
      emit(getdatalayoutsucces());
    }).catchError((error) {
      print(error.toString());
      emit(getdatalayouterror());
    });
  }

  var mtlayaout_catogry_data;

  List mylayout__catogry_data_data = [];

  void getCatogryData() async {
    print("get Catogry...");
    emit(getdatacatogrytloading());
    await dio_helpers.getData(url: "categories").then((value) {
      //  print(value.data.toString());
      mtlayaout_catogry_data = value.data["data"];
      mtlayaout_data = value.data["data"];
      mylayout__catogry_data_data = value.data["data"]["data"];

      // print(mylayout__catogry_data_data.toString());

      emit(getdatacatogrysucces());
    }).catchError((error) {
      print(error.toString());
      emit(getdatacatogryerror());
    });
  }

  fav_model myfavemodel;
  bool favstaus = true;

  String fav_message = "";

  void changeFavorites(int id) {
    myfav[id] = !myfav[id];

    emit(getdatafavsucces());

    dio_helpers
        .postData(url: "favorites", data: {"product_id": id}, token: const_token)
        .then((value) {
      emit(getdatafavsucces());
      favstaus = value.data["status"];
      fav_message = value.data["message"] ;
      myfavemodel = fav_model.fromJson(value.data);

      if (!myfavemodel.status) {
        myfav[id] = !myfav[id];
      }

      print(myfavemodel.status);

      print(myfavemodel.message);
    }).catchError((error) {
      print(error.toString());

      emit(getdatafaverror());
    });
  }
}
