import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class ThirdScreen extends StatefulWidget {
  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
    return ListView.builder(
        itemCount: items.length,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.only(top: 32),
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            direction: DismissDirection.startToEnd,
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
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4.0,
                                    spreadRadius: 0,
                                    offset: Offset(2.0, 0.0),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(12),
                              child: Text(
                                items[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ))),
                ])),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12))),
                behavior: SnackBarBehavior.fixed,
                content: Text("Sending $direction"),
              ));
            },
          );
        });
  }
}
