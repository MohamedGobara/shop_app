import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/cubit_layout/layout_cubit.dart';
import 'package:shop_app/cubit_layout/layout_states.dart';
import 'package:shop_app/cubit_login/login_cubit.dart';

class products_home extends StatefulWidget {
  @override
  _products_homeState createState() => _products_homeState();
}

class _products_homeState extends State<products_home> {
  List itemimage = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<layout_cubit, layout_states>(
      listener: (context, layout_states) {},
      builder: (context, layout_states) {
        return ConditionalBuilder(
          condition: layout_cubit.get(context).mtlayaout_data != null,
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
                "الرئيسيه",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  color: Colors.black,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CarouselSlider(
                  //     items: itemimage = layout_cubit
                  //         .get(context)
                  //         .mylayout_banners
                  //         .map((e) => Image(
                  //               image: NetworkImage(e["image"]),
                  //               //    fit: BoxFit.cover,
                  //             ))
                  //         .toList(),
                  //     options: CarouselOptions(
                  //         height: 150,
                  //         initialPage: 0,
                  //         enableInfiniteScroll: true,
                  //         viewportFraction: 1.0,
                  //         reverse: false,
                  //         autoPlay: true,
                  //         autoPlayAnimationDuration: Duration(seconds: 1),
                  //         autoPlayInterval: Duration(seconds: 1),
                  //         autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  //         scrollDirection: Axis.horizontal)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "الفئات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    height: 100,
                    child: ListView.separated(
                      itemBuilder: (contxt, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                color: Colors.white,
                                child: Image(
                                  image: NetworkImage(
                                    "${layout_cubit.get(context).mylayout__catogry_data_data[index]["image"]}",
                                  ),
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                              Container(
                                //   alignment: Alignment.bottomCenter

                                width: 90,
                                color: Colors.black45.withOpacity(0.8),
                                child: Text(
                                  layout_cubit
                                          .get(context)
                                          .mylayout__catogry_data_data[index]
                                      ["name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 8,
                        );
                      },
                      itemCount: layout_cubit
                          .get(context)
                          .mylayout__catogry_data_data
                          .length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "المنتجات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Container(
                    color: Colors.grey,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1 / 1.9,
                      children: List.generate(
                        layout_cubit.get(context).mylayout_products.length,
                        (index) => Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (layout_cubit
                                                .get(context)
                                                .mylayout_products[index]
                                            ["discount"] !=
                                        0)
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepOrange),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "خصومات",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        width: 60,
                                      ),
                                  ],
                                ),
                              ),

                              Image(
                                image: NetworkImage(
                                  layout_cubit
                                      .get(context)
                                      .mylayout_products[index]["image"],
                                ),
                                width: 120,
                                height: 180,
                              ),

                              Padding(
                                padding: EdgeInsets.all(13),
                                child: Column(
                                  children: [
                                    Text(
                                      layout_cubit
                                          .get(context)
                                          .mylayout_products[index]["name"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          " ${layout_cubit.get(context).mylayout_products[index]["price"]} ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.deepOrange,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            layout_cubit
                                                .get(context)
                                                .changeFavorites(layout_cubit
                                                        .get(context)
                                                        .mylayout_products[
                                                    index]["id"]);
                                            // setState(() {
                                            //
                                            //
                                            //   Fluttertoast.showToast(
                                            //       msg: "تمت الأضافة للمفضله بنجاح",
                                            //       toastLength: Toast.LENGTH_SHORT,
                                            //       gravity: ToastGravity.CENTER,
                                            //       timeInSecForIosWeb: 1,
                                            //       backgroundColor: Colors.green,
                                            //       textColor: Colors.white,
                                            //       fontSize: 16.0
                                            //   );
                                            //
                                            // });
                                            if (!layout_cubit
                                                .get(context)
                                                .favstaus) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "حدث خطأ , حاول في وقت آخر",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.red,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "${layout_cubit
                                                          .get(context).fav_message}",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.green,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0);
                                            }
                                          },
                                          icon: Icon(Icons.favorite),
                                          color: layout_cubit
                                                  .get(context)
                                                  .myfav[layout_cubit
                                                      .get(context)
                                                      .mylayout_products[index]
                                                  ["id"]]
                                              ? Colors.red
                                              : Colors.grey,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )

                              //       Column(
                              // children: [
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
