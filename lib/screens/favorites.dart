import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit_layout/layout_cubit.dart';
import 'package:shop_app/cubit_layout/layout_states.dart';

class favorites extends StatefulWidget {
  @override
  _favoritesState createState() => _favoritesState();
}

class _favoritesState extends State<favorites> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: BlocConsumer<layout_cubit, layout_states>(
          listener: (context, layout_states) {},
          builder: (context, layout_states) {
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
                  "ألمفضلة",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: Colors.black,
                  )
                ],
              ),





            );
          },
        ),
        create: (context) => layout_cubit()
          ..getProductsData()
          ..getCatogryData()
          ..initlist());
  }
}
