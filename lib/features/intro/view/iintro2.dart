import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Intro2PageView extends StatelessWidget {
  const Intro2PageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white60,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 250,
                height: 250,
                child: Image.asset(
                  'assets/images/2.gif',
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text('كما يعد بمثابة منصة الاكثر موثوقية للارشاد',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          const Text("الزراعي الافتراضي من خلال المعلومات الفنية و",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          const Text(
            "الارشادية المتخصصة في مختلف مجالات الانتاج الزراعي",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    ));
  }
}
