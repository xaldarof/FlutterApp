import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 300,
        margin: const EdgeInsets.all(24),
        child: Flexible(
            child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                alignment: Alignment.center,
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
                        borderRadius: BorderRadius.all(Radius.circular(24))),
                    child: Container(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: const [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Xoldarov Temur",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Teacher",
                                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal))),
                            Spacer()
                          ],
                        ))))));
  }
}
