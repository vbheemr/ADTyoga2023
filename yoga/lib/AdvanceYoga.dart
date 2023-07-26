import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yoga/userChallengeData.dart';
import 'NumberImage.dart';
import 'YogaInfoList.dart';

class AdvanceYoga extends StatefulWidget {
  final int dayNumber;
  final List<UserChallengeData> userChallengeDataList;
  const AdvanceYoga({
    super.key,
    required this.dayNumber,
    required this.userChallengeDataList,
  });

  @override
  State<AdvanceYoga> createState() => _AdvanceYogaState();
}

class _AdvanceYogaState extends State<AdvanceYoga> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    setState(() {
      userID = user!.uid;
      isLoading = false;
      userChallengeData = widget.userChallengeDataList.firstWhere(
          (element) => element.userId == userID,
          orElse: () => UserChallengeData(false, "", [], ""));

      selectedData = List<int>.from(userChallengeData.posesDone);
      userChallengeDataList = widget.userChallengeDataList;
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

  List<int> selectedData = [];
  String userID = "";
  late UserChallengeData userChallengeData;
  List<UserChallengeData> userChallengeDataList = [];

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

  bool edit = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          selectedData = [];
        });
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F2985),
          centerTitle: true,
          actions: [
            userChallengeData.timeStamp == ""
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      edit
                          ? setState(() {
                              edit = false;
                              userChallengeData = UserChallengeData(
                                false,
                                userID,
                                userChallengeData.posesDone,
                                userChallengeData.timeStamp,
                              );
                            })
                          : setState(() {
                              edit = true;
                              userChallengeData = UserChallengeData(
                                true,
                                userChallengeData.userId,
                                userChallengeData.posesDone,
                                userChallengeData.timeStamp,
                              );
                            });
                    },
                    icon: Icon(
                      edit ? Icons.edit : Icons.undo,
                      size: 26.0,
                    ),
                  ),
          ],
          title: Text(
            "Day ${widget.dayNumber + 1}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                child: Column(
                  children: <Widget>[
                    if (userChallengeData.isDone)
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                        child: Text(
                          "You have already provided the Asana's you did for this day on ${DateFormat('MM/dd/yyyy, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch((int.parse(userChallengeData.timeStamp))))}.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    FutureBuilder(
                      future: FirebaseDatabase.instance
                          .refFromURL(
                              "https://adtyoga-f8e60-default-rtdb.firebaseio.com")
                          .child('yoga')
                          .once(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.snapshot.value != null) {
                            List map = snapshot.data.snapshot.value;
                            for (var v in map) {
                              yogaList.add(
                                YogaInfoList(
                                  v["yNameHindi"],
                                  v["yNameEnglish"],
                                  v["about"],
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
                                            color:
                                                Colors.black.withOpacity(0.5),
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
                                                if (!userChallengeData.isDone) {
                                                  if (selectedData
                                                      .contains(i)) {
                                                    setState(() {
                                                      selectedData.removeWhere(
                                                          (element) =>
                                                              element == i);
                                                    });
                                                  } else {
                                                    if (selectedData.length >=
                                                        3) {
                                                      _displaySnackBar(context);
                                                    } else {
                                                      setState(() {
                                                        selectedData.add(i);
                                                      });
                                                    }
                                                  }
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      yogaList[i]
                                                          .hindiNameOfAasan,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontSize: 13.0,
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
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                    userChallengeData.isDone
                        ? const SizedBox()
                        : const SizedBox(
                            height: 60.0,
                          )
                  ],
                ),
              ),
        floatingActionButton: userChallengeData.isDone
            ? const SizedBox()
            : FloatingActionButton.extended(
                onPressed: () {
                  List pushingData = [];
                  FirebaseAuth auth = FirebaseAuth.instance;
                  User? user = auth.currentUser;
                  if (edit) {
                    userChallengeDataList
                        .removeWhere((element) => element.isDone == false);

                    userChallengeDataList.add(UserChallengeData(
                        true,
                        user!.uid,
                        selectedData,
                        (DateTime.now().millisecondsSinceEpoch).toString()));

                    for (var i = 0;
                        i < widget.userChallengeDataList.length;
                        i++) {
                      Map jsonData = userChallengeDataList[i]
                          .toJson(userChallengeDataList[i]);
                      pushingData.add(jsonData);
                    }
                  } else {
                    // Actual Edit Code
                    debugPrint("EDIT CODE");
                    userChallengeDataList.removeWhere((element) =>
                        element.isDone == false && element.timeStamp == "");
                    int val = userChallengeDataList
                        .indexWhere((element) => element.userId == userID);
                    userChallengeDataList[val] = UserChallengeData(
                        true,
                        user!.uid,
                        selectedData,
                        (DateTime.now().millisecondsSinceEpoch).toString());

                    for (var i = 0;
                        i < widget.userChallengeDataList.length;
                        i++) {
                      Map jsonData = userChallengeDataList[i]
                          .toJson(userChallengeDataList[i]);
                      pushingData.add(jsonData);
                    }
                  }
                  FirebaseDatabase.instance
                      .refFromURL(
                          "https://adtyoga-f8e60-default-rtdb.firebaseio.com")
                      .child('challenge')
                      .child(widget.dayNumber < 9
                          ? "day0${widget.dayNumber + 1}"
                          : "day${widget.dayNumber + 1}")
                      .child("users")
                      .set(pushingData);
                  Navigator.of(context).pop();
                },
                backgroundColor: const Color(0xFF0F2985),
                icon: const Icon(Icons.check),
                label: const Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
              ),
      ),
    );
  }
}
