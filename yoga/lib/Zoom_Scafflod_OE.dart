import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yoga/dayData.dart';
import 'package:yoga/userChallengeData.dart';
import 'AdvanceYoga.dart';
import 'NumberImage.dart';
import 'YogaInfoList.dart';
import 'YogaNextLevel.dart';
import 'Yoga_Detail.dart';
import 'signUp.dart';

List<YogaNextLevel> yogaGIFList = [
  YogaNextLevel("Surya Namaskar OR Sun Salutation",
      const AssetImage("images/GIF1.gif"), false),
  YogaNextLevel("Sukhasana OR \"The Easy or Pleasant Posture\"",
      const AssetImage("images/GIF2.gif"), false),
  YogaNextLevel("Gaumukhasana OR The Cow Head Posture",
      const AssetImage("images/GIF3.gif"), false),
  YogaNextLevel("Ardhamatsyendrasana OR The spinal half-twist Posture",
      const AssetImage("images/GIF4.gif"), false),
  YogaNextLevel("Nataprarthanasana OR The kneeling prayer Posture",
      const AssetImage("images/GIF5.gif"), false),
  YogaNextLevel("Bhujangasana OR The Cobra Posture",
      const AssetImage("images/GIF6.gif"), false),
  YogaNextLevel("Padmasana OR The Lotus Posture",
      const AssetImage("images/GIF7.gif"), false),
  YogaNextLevel("Ekpadasana OR The One Leg Posture",
      const AssetImage("images/GIF8.gif"), false),
  YogaNextLevel("Garudasana OR The Eagle Posture",
      const AssetImage("images/GIF9.gif"), false),
  YogaNextLevel("Sahaj Kantha Bhavasanas(SKB) OR Postures of Head and Neck",
      const AssetImage("images/GIF11.gif"), false),
  YogaNextLevel("Paschimottanasana OR The Posterior Stretch",
      const AssetImage("images/GIF12.gif"), false),
  YogaNextLevel("Sarvangasana OR The Shoulder Stand",
      const AssetImage("images/GIF13.gif"), false),
  YogaNextLevel("Vakrasana OR The Curve Posture",
      const AssetImage("images/GIF14.gif"), false),
  YogaNextLevel("Chakrasana OR The Wheel Posture",
      const AssetImage("images/GIF15.gif"), false),
  YogaNextLevel("Parvatasana OR The Mountain Posture",
      const AssetImage("images/GIF16.gif"), false),
  YogaNextLevel("Pavanamuktasana OR The Air Free Posture",
      const AssetImage("images/GIF17.gif"), false),
  YogaNextLevel("Ushtrasana OR The Camel Posture",
      const AssetImage("images/GIF18.gif"), false),
  YogaNextLevel("Talasana OR The Palm Tree Posture",
      const AssetImage("images/GIF19.gif"), false)
];

class ZoomScaffoldOE extends StatefulWidget {
  const ZoomScaffoldOE({
    super.key,
  });

  @override
  State<ZoomScaffoldOE> createState() => _ZoomScaffoldOEState();
}

class _ZoomScaffoldOEState extends State<ZoomScaffoldOE>
    with TickerProviderStateMixin {
  PageController pageController = PageController();
  int money = 0;
  // StreamController controller = StreamController.broadcast();

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

  final _auth = FirebaseAuth.instance;
  late User loggedinUser;

  //using this function you can use the credentials of the user
  // void getCurrentUser() {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedinUser = user;
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // var dbRef = ;

  @override
  void initState() {
    super.initState();
    // getCurrentUser();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  // DayData dayData = DayData([]);
  List<DayData> dayDataList = [];
  bool loading = false;
  // List<UserChallengeData> userChallengeData = [];

  fetchDataChallenge() async {
    await FirebaseDatabase.instance
        .refFromURL("https://adtyoga-f8e60-default-rtdb.firebaseio.com")
        .child('challenge')
        .once()
        .then((value) {
      setState(() {
        loading = true;
        dayDataList.clear();
      });
      var data = value.snapshot.value as Map;
      List list;
      for (var i = 0; i < 30; i++) {
        if (data[i < 9 ? "day0${i + 1}" : "day${i + 1}"] != "") {
          Map dataValue = data[i < 9 ? "day0${i + 1}" : "day${i + 1}"];
          List<UserChallengeData> udata = [];
          dataValue.forEach((k, v) {
            list = dataValue[k];

            for (var v in list) {
              udata.add(
                UserChallengeData(
                  v["isDone"],
                  v["userId"],
                  v["posesDone"].cast<int>(),
                  v["timeStamp"],
                ),
              );
            }
          });
          dayDataList.add(DayData(udata));
        } else {
          dayDataList.add(DayData([
            UserChallengeData(
              false,
              "",
              [],
              "",
            ),
          ]));
        }
      }
      setState(() {
        loading = false;
      });
    });
    // return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: SizedBox(
                child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xFF0F2985),
                  centerTitle: true,
                  title: const Text(
                    'Yoga for Life',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold),
                  ),
                  bottom: TabBar(
                    tabs: const [
                      Tab(text: 'Beginner\'s Level'),
                      Tab(text: 'Advance Level'),
                    ],
                    onTap: (value) {
                      if (value == 0) {}
                    },
                  ),
                  leading: IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      _auth.signOut();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        prefs.setBool("loggedIn", false);
                      });
                    },
                    tooltip: "Logout",
                  ),
                ),
                body: TabBarView(
                  // controller: tabController,
                  children: [
                    SizedBox(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 10.0,
                            ),
                            FutureBuilder(
                              future: FirebaseDatabase.instance
                                  .refFromURL(
                                      "https://adtyoga-f8e60-default-rtdb.firebaseio.com")
                                  .child('yoga')
                                  .once(),
                              builder: (context, snap) {
                                if (snap.hasData &&
                                    !snap.hasError &&
                                    snap.data!.snapshot.value != null) {
                                  List? map =
                                      snap.data!.snapshot.value as List?;
                                  for (var v in map!) {
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
                                              crossAxisCount: 2,
                                              childAspectRatio: 1.0,
                                              crossAxisSpacing: 5,
                                              mainAxisSpacing: 5),
                                      itemCount: yogaImageList.length,
                                      itemBuilder: (context, i) => SizedBox(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.0),
                                            ),
                                            backgroundColor: Colors.blue[200],
                                          ),
                                          child: SizedBox(
                                            // padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  child: Material(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    child: Image(
                                                      image: yogaImageList[i]
                                                          .asset,
                                                      height: 120.0,
                                                      width: 120.0,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                  yogaList[i].hindiNameOfAasan,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => YogaDetail(
                                                        hindiNameOfAasan:
                                                            yogaList[i]
                                                                .hindiNameOfAasan,
                                                        englishNameOfAasan:
                                                            yogaList[i]
                                                                .englishNameOfAasan,
                                                        about:
                                                            yogaList[i].about,
                                                        howToDo:
                                                            yogaList[i].howToDo,
                                                        yogaImage:
                                                            yogaImageList[i]
                                                                .asset)));
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return const Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: FutureBuilder(
                              future: FirebaseDatabase.instance
                                  .refFromURL(
                                      "https://adtyoga-f8e60-default-rtdb.firebaseio.com")
                                  .child('challenge')
                                  .once(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                dayDataList.clear();
                                if (snapshot.hasData &&
                                    !snapshot.hasError &&
                                    snapshot.data.snapshot.value != null) {
                                  var data = snapshot.data.snapshot.value;
                                  List list;
                                  for (var i = 0; i < 30; i++) {
                                    if (data[i < 9
                                            ? "day0${i + 1}"
                                            : "day${i + 1}"] !=
                                        "") {
                                      Map dataValue = data[i < 9
                                          ? "day0${i + 1}"
                                          : "day${i + 1}"];
                                      List<UserChallengeData> udata = [];
                                      dataValue.forEach((k, v) {
                                        list = dataValue[k];
                                        for (var v in list) {
                                          udata.add(
                                            UserChallengeData(
                                              v["isDone"],
                                              v["userId"],
                                              v["posesDone"].cast<int>(),
                                              v["timeStamp"],
                                            ),
                                          );
                                        }
                                      });
                                      dayDataList.add(DayData(udata));
                                    } else {
                                      dayDataList.add(DayData([
                                        UserChallengeData(
                                          false,
                                          "",
                                          [],
                                          "",
                                        ),
                                      ]));
                                    }
                                  }
                                  FirebaseAuth auth = FirebaseAuth.instance;
                                  User? user = auth.currentUser;
                                  String userID = "";
                                  // setState(() {
                                  userID = user!.uid;
                                  // });
                                  return loading
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          padding: const EdgeInsets.all(10.0),
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 1.0,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                          ),
                                          itemCount: dayDataList.length,
                                          itemBuilder: (context, i) {
                                            UserChallengeData u1 =
                                                dayDataList[i]
                                                    .userData
                                                    .firstWhere(
                                                        (element) =>
                                                            element.userId ==
                                                            userID,
                                                        orElse: () =>
                                                            UserChallengeData(
                                                                false,
                                                                "",
                                                                [],
                                                                ""));
                                            if (u1.isDone) {
                                              return SizedBox(
                                                width: 200.0,
                                                height: 200.0,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7.0)),
                                                    backgroundColor:
                                                        Colors.blue[100],
                                                  ),
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          const SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          Text(
                                                            'DAY - ${i + 1}',
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                          const SizedBox(
                                                            height: 5.0,
                                                          ),
                                                          const Icon(
                                                            Icons.check,
                                                            color: Colors.black,
                                                          )
                                                        ],
                                                      )),
                                                  onPressed: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            AdvanceYoga(
                                                          dayNumber: i,
                                                          userChallengeDataList:
                                                              dayDataList[i]
                                                                  .userData,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }
                                            return SizedBox(
                                              width: 200.0,
                                              height: 200.0,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.0)),
                                                  backgroundColor:
                                                      Colors.blue[100],
                                                ),
                                                child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Text(
                                                      'DAY - ${i + 1}',
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    )),
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          AdvanceYoga(
                                                        dayNumber: i,
                                                        userChallengeDataList:
                                                            dayDataList[i]
                                                                .userData,
                                                      ),
                                                    ),
                                                  );
                                                  fetchDataChallenge();
                                                },
                                              ),
                                            );
                                          },
                                        );
                                }
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))),
      ),
    );
  }
}
