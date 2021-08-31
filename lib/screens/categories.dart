import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubit_layout/layout_cubit.dart';
import 'package:shop_app/cubit_layout/layout_states.dart';

class catagories extends StatefulWidget {
  @override
  _catagoriesState createState() => _catagoriesState();
}

class _catagoriesState extends State<catagories> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => layout_cubit()
                ..getProductsData()
                ..getCatogryData())
        ],
        child: BlocConsumer<layout_cubit, layout_states>(
          listener: (context, layout_states) {},
          builder: (context, layout_states) {
            return ConditionalBuilder(
              condition:
                  layout_cubit.get(context).mylayout__catogry_data_data != null,
              builder: (context) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.white,
                  ),
                  elevation: 0,
                  title: Text(
                    "الفئات",
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
                body: InkWell(
                  onTap: () {},
                  child: ListView.separated(
                    itemBuilder: (contxt, index) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 140,
                                height: 150,
                                color: Colors.white,
                                child: Image(
                                  image: NetworkImage(
                                    "${layout_cubit.get(context).mylayout__catogry_data_data[index]["image"]}",
                                  ),
                                  width: 300,
                                  height: 200,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                layout_cubit
                                    .get(context)
                                    .mylayout__catogry_data_data[index]["name"],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15),
                                //textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer() ,
                              IconButton(onPressed: (){}, icon: Icon (Icons.arrow_forward_ios_outlined))
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 0.7,
                        color: Colors.black,
                      );
                    },
                    itemCount: layout_cubit
                        .get(context)
                        .mylayout__catogry_data_data
                        .length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
