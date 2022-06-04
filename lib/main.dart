import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:untitled/DetailScreen.dart';
import 'package:untitled/FirstScreen.dart';
import 'package:untitled/SecondSceen.dart';
import 'package:untitled/ThirdScreen.dart';
import 'package:untitled/routes.dart';

import 'DragableScreen.dart';

main() => runApp(MainWidget());

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<MainWidget> createState() => Main();
}

class User {
  late int id;
  late String name;
  late bool isSelected;

  User(this.id, this.name, this.isSelected);
}

class Main extends State<MainWidget> {
  List<User> items = [];

  var currentItem = 0;

  final screens = [FirstScreen(), SecondScreen(), ThirdScreen()];

  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 10; i++) {
      var isAccepted = i % 2 == 0;
      items.add(User(i, "Temur $i", isAccepted));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          // DETAIL_SCREEN_ROUTE: (context) => DetailScreen(),
          DRAGABLE_SCREEN_ROUTE: (context) => DragableScreen(),
        },
        home: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark, // For iOS (dark icons)
              ),
              backgroundColor: Colors.white,
              elevation: 2,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              title: const Text(
                "Hola Temur",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: screens[currentItem],
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstScreen()),
                );
              },
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38, spreadRadius: 0, blurRadius: 4),
                  ]),
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.blue,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.favorite), label: "Favorites"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person), label: "Profile"),
                    ],
                    onTap: (index) {
                      setState(() {
                        currentItem = index;
                      });
                    },
                    currentIndex: currentItem,
                  )),
            )));
  }

  Widget makeBlurImage() {
    return Blur(
        blur: 0.9,
        borderRadius: BorderRadius.circular(18),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network('https://picsum.photos/250?image=9'),
        ));
  }

  Widget toggleVisibilityState(int index) {
    if (items[index].isSelected) {
      return GestureDetector(
          onTap: () {
            setState(() {
              items[index].isSelected = !items[index].isSelected;
            });
          }, // Image tapped
          child: const Icon(Icons.remove_red_eye));
    } else {
      return GestureDetector(
          onTap: () {
            setState(() {
              items[index].isSelected = !items[index].isSelected;
            });
          }, // Image tapped
          child: const Icon(Icons.block));
    }
  }

  Widget makeImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Image.network('https://picsum.photos/250?image=9'),
    );
  }
}
