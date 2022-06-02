import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/secondScreen.dart';
import 'package:http/http.dart' as http;

main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class User {
  late int id;
  late String name;
  late bool isAccepted;

  User(this.id, this.name, this.isAccepted);
}

class _AppState extends State<App> {
  List<User> items = [];

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
            body: ListView.builder(
                itemCount: items.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: const EdgeInsets.only(top: 32),
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    key: UniqueKey(),
                    child: SizedBox(
                        height: 100,
                        child: Column(children: [
                          Flexible(
                              child: FractionallySizedBox(
                                  heightFactor: 0.8,
                                  widthFactor: 0.9,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 4.0,
                                            spreadRadius: 0,
                                            offset: Offset(2.0, 0.0),
                                          )
                                        ],
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24))),
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.all(12),
                                        child: Row(children: [
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(18),
                                            child: Image.network(
                                                'https://picsum.photos/250?image=9'),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(12)),
                                          Text(
                                            items[index].name,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )
                                        ])),
                                  ))),
                        ])),
                    onDismissed: (direction) {
                      setState(() {
                        items.removeAt(index);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Sending $direction"),
                        dismissDirection: DismissDirection.startToEnd,
                      ));
                    },
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScrren()),
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
                          icon: Icon(Icons.person_off), label: "Profile"),
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

  int currentItem = 0;
}
