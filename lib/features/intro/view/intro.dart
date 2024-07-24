import 'package:first_app/core/shared/shared_preferences_service.dart';
import 'package:first_app/features/intro/view/intro1.dart';
import 'package:first_app/features/showPlant/view/menu.dart';
import 'package:flutter/material.dart';

import 'intro3.dart';

// ignore: must_be_immutable
class IntroPageView extends StatelessWidget {
  const IntroPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 200,
                height: 120,
                child: Image.asset(
                  'assets/images/4.jpg',
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
                if (SharedPreferencesService.getFirstTime() != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (c) =>
                          SharedPreferencesService.getToken() != null
                              ? MenuPageView()
                              : const Intro3PageView(),
                    ),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (c) => const Intro1PageView(),
                    ),
                  );
                }
              },
              child: const Text("خضرا",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          )
        ]),
      ),
    ));
  }
}
