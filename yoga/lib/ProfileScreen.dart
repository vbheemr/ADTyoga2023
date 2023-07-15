import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool isLoading = false;
  bool isEditTrue = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        isLoading = true;
        user = auth.currentUser;
      });
      await FirebaseDatabase.instance
          .refFromURL("https://adtyoga-f8e60-default-rtdb.firebaseio.com")
          .child('users')
          .child(user!.uid)
          .once()
          .then((value) {
        Map<dynamic, dynamic> val = value.snapshot.value as Map;
        setState(() {
          _nameController = TextEditingController(text: val["fullName"]);
          _emailController = TextEditingController(text: val["email"]);
          isLoading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: const Color(0xFF0F2985),
          title: const Text('Profile Screen'),
          actions: [
            IconButton(
              icon:
                  isEditTrue ? const Icon(Icons.undo) : const Icon(Icons.edit),
              onPressed: () {
                setState(() {
                  isEditTrue = !isEditTrue;
                });
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Theme(
                  data: ThemeData(
                    disabledColor: Colors.black,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      const Center(
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF0F2985),
                          radius: 100,
                          child: Icon(
                            Icons.person,
                            size: 100.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60.0),
                      TextField(
                        controller: _nameController,
                        enabled: !isEditTrue ? false : true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          icon: Text(
                            'Name:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _emailController,
                        enabled: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          icon: Text(
                            'Email:',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (isEditTrue)
                        Center(
                          child: SizedBox(
                            width: 100.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F2985),
                              ),
                              child: const Text('Update'),
                              onPressed: () async {
                                Map<dynamic, dynamic> value1 =
                                    <dynamic, dynamic>{
                                  "fullName": _nameController.text,
                                  "email": _emailController.text,
                                };
                                await FirebaseDatabase.instance
                                    .refFromURL(
                                        "https://adtyoga-f8e60-default-rtdb.firebaseio.com")
                                    .child('users')
                                    .child(user!.uid)
                                    .set(value1);
                                setState(() {
                                  isEditTrue = false;
                                });
                              },
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
