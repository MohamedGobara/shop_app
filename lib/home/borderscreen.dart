import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/login.dart';
import 'package:shop_app/shared/shared_pre.dart';

class border_screen extends StatefulWidget {
  @override
  _border_screenState createState() => _border_screenState();
}

class _border_screenState extends State<border_screen> {
  List image = [
    "lib/image/one.jpg",
    "lib/image/pexels-karolina-grabowska-5625130.jpg",
    "lib/image/three.jpg"
  ];

  List title = ["سنتر جباره التجاري", "خصومات مبتخلصش", "كل متطلباتك بمكان واحد"];

  List subtitle = ["سوق الكتروني متكامل لكل مستلزماتك ", " كل اسبوع هتلاقي خصومات مبتخلصش ", "هيوصلك كل اللي محتاجه بضغطة زر"];
  var pagecontroller = PageController();
  bool islast = false;
  var my;
  void skip() async {
    await CachHelper.setData(key: "skipdeborder", value: true).then((value) {
      if (value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (Context) => login()));
      }
    });

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pagecontroller,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => build_pageview(
                image[index], title[index], subtitle[index], index),
            itemCount: 3,
            onPageChanged: (index) {
              if (index == title.length - 1) {
                setState(() {
                  islast = true;
                });
                print("last");
              } else {
                setState(() {
                  islast = false;
                });
                print("not last");
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (islast) {
            skip();




          } else {
            //  islast = false;

            pagecontroller.nextPage(
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn);
          }
        },
        backgroundColor: islast ? Colors.indigo : Colors.deepOrangeAccent,
        child: islast == true
            ? Icon(Icons.login_rounded)
            : Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}

Widget build_pageview(String image, String title, String subtitle, int count) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                      "$image",
                    ),
                    fit: BoxFit.cover)),
          ),
        ),

        Container(
          width: double.infinity,
          color: Colors.blueGrey.withOpacity(0.7),
          child: DotsIndicator(
            position: count.toDouble(),
            dotsCount: 3,
            decorator: DotsDecorator(
              size: Size.square(20),
              activeColor: Colors.deepOrangeAccent,
              activeSize: Size(10, 20),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),

        //  SizedBox(height: 100),
        Container(
          color: Colors.blueGrey.withOpacity(0.7),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45 , color: Colors.black)  ),
              SizedBox(
                height: 15,
              ),
              Text(
                "$subtitle",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,

                    color: Color.fromRGBO(8, 32, 50, 1)),
              )

],
          ),
        )
      ],
    );
