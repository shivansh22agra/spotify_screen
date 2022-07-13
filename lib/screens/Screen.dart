import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  static const IconData book = IconData(0xe0ef, fontFamily: 'MaterialIcons');
  static String id = "Screen";
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  List _genres = [];

  List<bool> isSelected = [];

  @override
  void initState() {
    readJson();
    super.initState();
  }

  void readJson() async {
    final String response = await rootBundle.loadString('assets/Genres.json');
    final data = await json.decode(response);
    _genres = data["Genres"];
    setState(() {});
    print(_genres.length);
    for (var i = 0; i <= _genres.length; i++) {
      isSelected.add(false);
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            Text(
              "Skip",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
          backgroundColor: Colors.black,
          elevation: 0,
          title: Expanded(
            child: Text(
              "WHAT DO YOU LIKE?",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 25),
            ),
          ),
        ),
        body: Column(
          children: [
            Text(
              "Select a few things you like and we will show you content that will inspire you",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 120,
                  crossAxisCount: 2,
                ),
                itemCount: _genres.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    height: MediaQuery.of(context).size.height * 2,
                    width: MediaQuery.of(context).size.width * 2,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isSelected[index] = !isSelected[index];
                        });
                      },
                      child: Column(children: [
                        Expanded(
                          child: ImageIcon(
                            NetworkImage("${_genres[2]["icon"]}"),
                            // size: 70
                            size: MediaQuery.of(context).size.height * 2,
                          ),
                        ),
                        Text(
                          "${_genres[index]["name"]}",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ]),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: isSelected[index]
                              ? Color(0xFF9389D9)
                              : Colors.transparent,
                          width: 4),
                      borderRadius: BorderRadius.circular(20),
                      color: isSelected[index]
                          ? Color(0xFF9389D9)
                          : Color(0xFF333333),
                    ),
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
