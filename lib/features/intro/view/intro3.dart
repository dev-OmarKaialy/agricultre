import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../auth/presentation/signin.dart';
import '../../auth/presentation/signup.dart';

// ignore: must_be_immutable
class Intro3PageView extends StatelessWidget {
  const Intro3PageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/images/21.png',
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 59, 92, 30)),
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInViewPage()
                        .animate()
                        .slideX(begin: 1, end: 0),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("تسجيل الدخول",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 59, 92, 30)),
              ),
              onPressed: () async {
                //       // await     controller.getAllProduct();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignuPageView()
                        .animate()
                        .slideX(begin: 1, end: 0),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("تسجيل حساب جديد",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
