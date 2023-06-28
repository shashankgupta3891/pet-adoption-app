import 'package:flutter/material.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/presentation/pages/home_page.dart';
import 'presentation/pages/history_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const PetAdoptionApp());
}

class PetAdoptionApp extends StatelessWidget {
  const PetAdoptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Adoption App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // textTheme: GoogleFonts.poppinsTextTheme.call(),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const HomeScreen(),
        '/history': (ctx) => const HistoryPage(),
      },
    );
  }
}
