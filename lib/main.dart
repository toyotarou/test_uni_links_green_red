import 'package:flutter/material.dart';

import 'screens/green_screen.dart';
import 'screens/red_screen.dart';
import 'services/uni_links_service.dart';
import 'utility/context_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UniLinksService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: ContextUtility.navigatorKey,
      routes: {
        '/': (_) => const InitialScreen(),
        '/green': (_) => const GreenScreen(),
        '/red': (_) => const RedScreen(),
      },
    );
  }
}

/////////////////////////

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
