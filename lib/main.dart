import 'package:flutter/material.dart';
import 'package:shop_app/const/myconst.dart';
import 'package:shop_app/home/borderscreen.dart';
import 'package:shop_app/screens/categories.dart';
import 'package:shop_app/screens/layout.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/screens/setting.dart';
import 'package:shop_app/shared/shared_pre.dart';
import 'package:shop_app/theme/themedata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CachHelper.init();

  bool isskipdborder = await CachHelper.getData(key: "skipdeborder");
    bool islogin= CachHelper.getData(key: "islogin") ;
    print(islogin.toString());

  Widget wid;
  if (isskipdborder != null) {
    if ( islogin==null ||islogin==false ) {
      wid =login() ;
    } else {
      wid = layout();
    }
  } else {
    wid = border_screen();
  }


  runApp(MyApp(wid));
}

class MyApp extends StatelessWidget {
  Widget mywidget;

  MyApp(this.mywidget);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mytheme,
      home: mywidget,
      debugShowCheckedModeBanner: false,
    );
  }
}
