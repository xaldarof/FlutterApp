import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/DetailScreen.dart';

import 'main.dart';
import 'models/RemoteImageModel.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<User> items = [];

  late Future<List<RemoteImageModel>> photos;

  @override
  void initState() {
    super.initState();
    photos = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: photos,
        builder: (BuildContext context,
            AsyncSnapshot<List<RemoteImageModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                padding: const EdgeInsets.only(top: 32),
                itemBuilder: (BuildContext context, int index) {
                  var titleBase = snapshot.data?[index].title ?? "";
                  var title = titleBase.substring(0, (titleBase.length) ~/ 3);

                  return Dismissible(
                    direction: DismissDirection.startToEnd,
                    key: UniqueKey(),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  title: snapshot.data?[index].title ?? ""),
                            ));
                      },
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
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(18)),
                                                child: Image.network(snapshot
                                                        .data?[index]
                                                        .thumbnailUrl ??
                                                    "")),
                                            const Padding(
                                                padding: EdgeInsets.all(12)),
                                            Text(
                                              title,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))),
                          ])),
                    ),
                    onDismissed: (direction) {
                      showBottomSheetMine(context);
                    },
                  );
                });
          }
        });
  }

  void showBottomSheetMine(BuildContext context) {
    showModalBottomSheet(

        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return const Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              color: Colors.white,
              margin: EdgeInsets.all(24),
              child: Center(
                child: Text("Bottom sheet dialog"),
              ));
        });
  }
}
