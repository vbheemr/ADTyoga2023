import 'package:shared_preferences/shared_preferences.dart';
import 'splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loading = true;
  bool ifLoggedIn = false;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   final SharedPreferences prefs = await SharedPreferences.getInstance();
    //   if (prefs.containsKey("loggedIn")) {
    //     setState(() {
    //       ifLoggedIn = prefs.getBool("loggedIn")!;
    //     });
    //   }
    //   setState(() {
    //     loading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0F2985),
      ),
      home: const SplashScreen(),
    );
  }
}
