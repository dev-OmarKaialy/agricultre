import 'package:bot_toast/bot_toast.dart';
import 'package:first_app/core/shared/shared_preferences_service.dart';
import 'package:first_app/features/intro/view/intro.dart';
import 'package:flutter/material.dart';

import 'core/shared/service_locator.dart';

final rootKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([SharedPreferencesService.init(), init()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: rootKey,
      title: 'Flutter Project',
      key: key,
      theme: ThemeData.light(),
      builder: BotToastInit(),
      home: const IntroPageView(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
