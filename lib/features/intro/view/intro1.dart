import 'package:first_app/core/shared/shared_preferences_service.dart';
import 'package:first_app/features/intro/view/intro3.dart';
import 'package:flutter/material.dart';

import 'iintro2.dart';

// ignore: must_be_immutable
class Intro1PageView extends StatefulWidget {
  const Intro1PageView({super.key});

  @override
  State<Intro1PageView> createState() => _Intro1PageViewState();
}

class _Intro1PageViewState extends State<Intro1PageView> {
  final controller = PageController();
  final index = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (o) {
            index.value = o;
          },
          controller: controller,
          children: [
            Container(
              color: Colors.white60,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('هذا التطبيق يستهدف تمكين المزارعين من الحصول',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      const Text(
                          "   على المعرفة المتكاملة وتطبيق الممارسات الزراعية",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      const Text("الجيدة وبناء قدراتهم للاستدامة الزراعية",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 250,
                            height: 250,
                            child: Image.asset(
                              'assets/images/11.gif',
                            )),
                      ),
                    ]),
              ),
            ),
            const Intro2PageView()
          ],
        ),
        Positioned(
          bottom: 100,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ValueListenableBuilder(
                valueListenable: index,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AnimatedCrossFade(
                          firstChild: IconButton(
                              onPressed: () {
                                controller.previousPage(
                                    duration: Durations.extralong1,
                                    curve: Curves.ease);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                          secondChild: const SizedBox(),
                          crossFadeState: value > 0
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: Durations.extralong1),
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 59, 92, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(120)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15)),
                        onPressed: () async {
                          if (value >= 1) {
                            await SharedPreferencesService.storeFirstTime();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Intro3PageView(),
                                ));
                          } else {
                            controller.nextPage(
                                duration: Durations.extralong1,
                                curve: Curves.ease);
                          }
                        },
                        child: const Text(
                          "التالي",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        )
      ],
    ));
  }
}
