import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/Page1.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var title = widget.title.substring(0, (widget.title.length) ~/ 3);

    return DefaultTabController(
        length: 5,
        child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  titleSpacing: 0,
                  iconTheme: const IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24))),
                  title: Text(
                    "Hola $title",
                    style: const TextStyle(color: Colors.black),
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.blue,
                    padding: EdgeInsets.all(12),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Colors.blueAccent)),
                    tabs: const [
                      Tab(
                          icon: Icon(
                        Icons.music_note,
                        color: Colors.black,
                      )),
                      Tab(icon: Icon(Icons.music_video, color: Colors.black)),
                      Tab(icon: Icon(Icons.camera_alt, color: Colors.black)),
                      Tab(icon: Icon(Icons.grade, color: Colors.black)),
                      Tab(icon: Icon(Icons.email, color: Colors.black)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    Page1(),
                    Page1(),
                    Page1(),
                    Page1(),
                    Page1(),
                  ],
                ))));
  }
}

// Container(
// margin: EdgeInsets.all(24),
// child: Material(
// color: Colors.white,
// borderRadius: BorderRadius.circular(12),
// elevation: 4,
// child: ExpansionTileCard(
// elevation: 0,
// key: cardB,
// leading: CircleAvatar(child: const Text('A')),
// title: const Text('Tap to Expand!'),
// subtitle: Text('It has the GFG Logo.'),
// children: <Widget>[
// const Divider(
// thickness: 1.0,
// height: 1.0,
// ),
// Align(
// alignment: Alignment.centerLeft,
// child: Padding(
// padding: const EdgeInsets.symmetric(
// horizontal: 16.0,
// vertical: 8.0,
// ),
// child: ClipRRect(
// borderRadius:
// const BorderRadius.all(Radius.circular(16)),
// child: Image.network(
// "https://source.unsplash.com/user/c_v_r/100x100"))),
// )
// ])))
