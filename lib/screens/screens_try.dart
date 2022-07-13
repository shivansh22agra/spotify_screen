import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Screen_try extends StatefulWidget {
  static String id = "Screen_try";
  const Screen_try({Key? key}) : super(key: key);

  @override
  State<Screen_try> createState() => _Screen_tryState();
}

class _Screen_tryState extends State<Screen_try> {
  List<bool> isSelected = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  background: Image.asset(
                    "assets/images/pic.png",
                    fit: BoxFit.cover,
                  )),
              expandedHeight: 230,
              backgroundColor: Colors.purple,
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          isSelected[index] = false;
                        });
                      },
                      onTap: () {
                        setState(() {
                          isSelected[index] = true;
                        });
                      },
                      child: Column(children: [
                        Text(
                          "Hello",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Expanded(
                            child: Center(
                                child: LottieBuilder.network(
                                    "https://assets4.lottiefiles.com/packages/lf20_wh5alaq6.json"))),
                        Text("Hello",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ]),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected[index]
                            ? Colors.white70
                            : Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  );
                }, childCount: 8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200, crossAxisCount: 2)),
          ],
        ));
  }
}
