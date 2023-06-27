import 'dart:async';

import 'package:flutter/material.dart';

class YogaClassesDetail extends StatefulWidget {
  const YogaClassesDetail({super.key});

  @override
  State<YogaClassesDetail> createState() => _YogaClassesDetailState();
}

class _YogaClassesDetailState extends State<YogaClassesDetail> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2985),
        centerTitle: true,
        title: const Text(
          'Yoga Classes',
          style: TextStyle(
              color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Bliss The Yoga Studio",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: 101, VIKAS COMMERCIAL, BHAKTI MARG , Mulund West, Mumbai, Maharashtra 400080",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 098209 44332',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Aarogyyam Yoga Institute & Nutrition Centre",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: 201, Zeneeth Puranics Commercial Complex Next to Vikas Paradise Near Santoshi Mata Temple, Mulund West, Mumbai, Maharashtra 400080",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 086522 92092',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Pure Fitness Power Yoga Classes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: Nair Bhavan 2-5, Royal Tower, 3, Sreenagar Wagale Estate Ashram Rd, Sector 400604, Sector No 3, Shree Nagar, Thane West, Thane, Maharashtra 400604",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 099204 51076',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Jyoti's Yoga And Meditation Classes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: 1-52, Ganesh Gawade Rd, Mulund West, Mumbai, Maharashtra 400080",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 098203 56818',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Premanand Yoga",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: Traffic police Station, Anand Bhuvan, Premanand Yoga Zhade niwas near new, soc, opp. kopri, Thane East, Thane, Maharashtra 400603",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 080805 04061',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Sadguru Mangeshda Kriya Yoga Foundation, Mulund centre",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: 201, Manish Appartment, Opposite Johnson & Johnson, Above Canara Bank, L B S Marg, Mulund West, Mumbai, 400080",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 098203 10707',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Ambika Yog Kutir Mulund Branch",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: municipalty school, Goshala Rd, Ramgad Nagar, Vishwakarma Nagar, Mulund West, Mumbai, Maharashtra 400080",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 099697 78222',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Art of Living",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: The city of joy, euphoria hall, JSD Road, Mulund,(W), near Mulund Station, Mumbai, Maharashtra 400080",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 097694 32693',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Color(0xFF0F2985), width: 2.0)),
                  elevation: 10.0,
                  margin: const EdgeInsets.all(3.0),
                  child: ListTile(
                    title: const Center(
                      child: Text(
                        "Nitya Yog",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 21.0),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(10.0),
                    subtitle: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              "Address: Plot No. 475, Parvati Nivas, Gokhale Road, Naupada, Thane, Maharashtra 400602",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              'Phone: 096199 80360',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
