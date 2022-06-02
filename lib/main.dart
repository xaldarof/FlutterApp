import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text("Hello Temur"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.only(top: 32),
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                child: Container(
                    height: 100,
                    child: Column(children: [
                      Flexible(
                          child: FractionallySizedBox(
                              heightFactor: 0.8,
                              widthFactor: 0.9,
                              child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12)))))),
                    ])),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sending $direction")));
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              items.add(User(items.length + 1, "", true));
            });
          },
        ),
      ),
    );
  }
}
