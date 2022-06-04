import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DragableCart.dart';

class DragableScreen extends StatefulWidget {
  @override
  State<DragableScreen> createState() => _DragableScreenState();
}

class _DragableScreenState extends State<DragableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DraggableCard(
            child: SizedBox(
          width: 100,
          height: 100,
          child: Container(color: Colors.black),
        )),
      ),
    );
  }
}
