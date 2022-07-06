import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  List _radios = [];
  @override
  void initState() {
    readJson();
    super.initState();
  }

  void readJson() async {
    final String response = await rootBundle.loadString('assets/radio.json');
    final data = await json.decode(response);
    _radios = data["radios"];
    setState(() {});
    // print(_radios.length);
    // print(_radios[0]["image"]);
  }

  Widget build(BuildContext context) {
   // readJson();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text(
            "Search",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 50),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
            margin: EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                  decoration: InputDecoration(
                prefixIcon: Visibility(
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                hintText: "Search",
              )),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 150,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                itemCount: _radios.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Text(
                      "${_radios[index]["name"]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${_radios[index]["image"]}"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.teal,
                    ),
                    // margin: EdgeInsets.all(20),
                    height: 100,
                    width: 100,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
