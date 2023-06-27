import 'package:flutter/material.dart';

class YogaDetail extends StatefulWidget {
  final String hindiNameOfAasan;
  final String englishNameOfAasan;
  final String about;
  final String howToDo;
  final AssetImage yogaImage;

  const YogaDetail(
      {required this.hindiNameOfAasan,
      required this.englishNameOfAasan,
      required this.about,
      required this.howToDo,
      required this.yogaImage,
      super.key});

  @override
  State<YogaDetail> createState() => _YogaDetailState();
}

class _YogaDetailState extends State<YogaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2985),
        centerTitle: true,
        title: const Text(
          'Asana Detail',
          style: TextStyle(
              color: Colors.white, fontSize: 21.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.hindiNameOfAasan,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                    left: 0.0, right: 0.0, bottom: 5.0, top: 0.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
              ),
              Text(
                '" ${widget.hindiNameOfAasan} " is Sanskrit Name for the Asana. It is also called as " ${widget.englishNameOfAasan} " in English perspective.',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF0F2985), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[100],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      child: Image(
                        image: widget.yogaImage,
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('About the Asana:- ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
              const Padding(
                padding: EdgeInsets.only(
                    left: 0.0, right: 290.0, bottom: 5.0, top: 0.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF0F2985), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Colors.blue[100]
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.about,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      // shadows: [
                      //   Shadow(
                      //     blurRadius: 10.0,
                      //     color: Colors.black26,
                      //     offset: Offset(5.0, 5.0),
                      //   ),
                      // ],
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('How to do the Asana:- ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
              const Padding(
                padding: EdgeInsets.only(
                    left: 0.0, right: 290.0, bottom: 5.0, top: 0.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 2.0,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFF0F2985), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Colors.blue[100]
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.howToDo,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      // shadows: [
                      //   Shadow(
                      //     blurRadius: 10.0,
                      //     color: Colors.black26,
                      //     offset: Offset(5.0, 5.0),
                      //   ),
                      // ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
