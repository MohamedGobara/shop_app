import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit_layout/layout_cubit.dart';
import 'package:shop_app/cubit_layout/layout_states.dart';

class layout extends StatefulWidget {
  @override
  _layoutState createState() => _layoutState();
}

class _layoutState extends State<layout> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => layout_cubit()
              ..getProductsData()
              ..getCatogryData()
              ..initlist()

        )
      ],
      child: BlocConsumer<layout_cubit, layout_states>(
        listener: (context, layout_states) {},
        builder: (context, layout_states) {
          return Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   backwardsCompatibility: false,
            //   systemOverlayStyle: SystemUiOverlayStyle(
            //     statusBarIconBrightness: Brightness.dark,
            //     statusBarColor: Colors.white,
            //   ),
            //   elevation: 0,
            // ),
            body: layout_cubit
                .get(context)
                .screens[layout_cubit.get(context).index],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color.fromRGBO(142, 38, 87, 1),
              elevation: 20.0,
              selectedFontSize: 20,
              selectedItemColor: Colors.deepOrangeAccent,
              unselectedItemColor: Colors.black45,
              unselectedLabelStyle:
                  TextStyle(fontSize: 15, color: Colors.black45),
              items: [
                BottomNavigationBarItem(
                  label: "الرئيسيه",
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "الفئات",
                  icon: Icon(
                    Icons.category_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "المفضلة",
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "الإعدادات",
                  icon: Icon(
                    Icons.settings,
                  ),
                ),
              ],
              iconSize: 25,
              currentIndex: layout_cubit.get(context).index,
              onTap: (index) {
                setState(() {
                  layout_cubit.get(context).index = index;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
