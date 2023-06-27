import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'NumberImage.dart';
import 'YogaInfoList.dart';
import 'Zoom_Scafflod_OE.dart';

class AdvanceYoga extends StatefulWidget {
  final String yogaName;
  final AssetImage yogaGIF;

  const AdvanceYoga(this.yogaName, this.yogaGIF, {super.key});

  @override
  State<AdvanceYoga> createState() => _AdvanceYogaState();
}

class _AdvanceYogaState extends State<AdvanceYoga> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 1), () {

    // });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        isLoading = false;
      });
    });
  }

  _displaySnackBar(context) {
    return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "You can only select 3 Asana's for today!",
        style: TextStyle(fontFamily: 'Courgette'),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  List selectedData = [];

  List<NumberImage> yogaImageList = [
    NumberImage(asset: const AssetImage("images/GIF1.gif")),
    NumberImage(asset: const AssetImage("images/GIF2.gif")),
    NumberImage(asset: const AssetImage("images/GIF3.gif")),
    NumberImage(asset: const AssetImage("images/GIF4.gif")),
    NumberImage(asset: const AssetImage("images/GIF5.gif")),
    NumberImage(asset: const AssetImage("images/GIF6.gif")),
    NumberImage(asset: const AssetImage("images/GIF7.gif")),
    NumberImage(asset: const AssetImage("images/GIF8.gif")),
    NumberImage(asset: const AssetImage("images/GIF9.gif")),
    NumberImage(asset: const AssetImage("images/GIF11.gif")),
    NumberImage(asset: const AssetImage("images/GIF12.gif")),
    NumberImage(asset: const AssetImage("images/GIF13.gif")),
    NumberImage(asset: const AssetImage("images/GIF14.gif")),
    NumberImage(asset: const AssetImage("images/GIF15.gif")),
    NumberImage(asset: const AssetImage("images/GIF16.gif")),
    NumberImage(asset: const AssetImage("images/GIF17.gif")),
    NumberImage(asset: const AssetImage("images/GIF18.gif")),
    NumberImage(asset: const AssetImage("images/GIF19.gif"))
  ];

  List<YogaInfoList> yogaList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2985),
        centerTitle: true,
        title: const Text(
          'Yoga for Life',
          style: TextStyle(
              color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              child: Column(
                children: <Widget>[
                  StreamBuilder(
                    stream: FirebaseDatabase.instance
                        .refFromURL(
                            "https://adtyoga-f8e60-default-rtdb.firebaseio.com")
                        .child('yoga')
                        .onValue,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.snapshot.value != null) {
                          List map = snapshot.data.snapshot.value;
                          // List<YogaInfoList> list =
                          //     map.values.toList();
                          for (var v in map) {
                            yogaList.add(
                              YogaInfoList(
                                v["about"],
                                v["yNameHindi"],
                                v["yNameEnglish"],
                                v["howToDo"],
                              ),
                            );
                          }
                          return Expanded(
                            child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              padding: const EdgeInsets.all(10.0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.0,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                              ),
                              itemCount: yogaImageList.length,
                              itemBuilder: (context, i) => SizedBox(
                                child: SizedBox(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Image(
                                        image: yogaImageList[i].asset,
                                        height: 160.0,
                                      ),
                                      Container(
                                        width: 200.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            onTap: () {
                                              if (selectedData.contains(i)) {
                                                setState(() {
                                                  selectedData.removeWhere(
                                                      (element) =>
                                                          element == i);
                                                });
                                              } else {
                                                if (selectedData.length >= 3) {
                                                  _displaySnackBar(context);
                                                } else {
                                                  setState(() {
                                                    selectedData.add(i);
                                                  });
                                                }
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    yogaList[i]
                                                        .hindiNameOfAasan,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  selectedData.contains(i)
                                                      ? const Icon(
                                                          Icons.check,
                                                          color: Colors.white,
                                                        )
                                                      : const SizedBox(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                  const SizedBox(
                    height: 60.0,
                  )
                ],
              ),
            ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
          onPressed: () {
            // if (!yogaGIFList[widget.yogaNumber].isDone) {
            //   yogaGIFList[widget.yogaNumber].isDone = true;
            //   Navigator.of(context).pop();
            // } else {
            //   _displaySnackBar(context);
            // }
          },
          backgroundColor: const Color(0xFF0F2985),
          icon: const Icon(Icons.check),
          label: const Text(
            "Done",
            style: TextStyle(fontSize: 18.0, fontFamily: 'Monotype Corsiva'),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
      ),
    );
  }
}
