import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/presentation/bloc/pet_bloc.dart';
import 'package:pet_adoption_app/presentation/pages/detail_page.dart';
import 'package:pet_adoption_app/presentation/pages/temp_home2.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (ctx) => HomeBloc(getIt.get(), getIt.get()),
        )
      ],
      child: MaterialApp(
        title: 'Pet Adoption App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // textTheme: GoogleFonts.poppinsTextTheme.call(),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const AdoptionScreen(),
          '/details': (ctx) => const DetailsPage(),
          '/history': (ctx) => const HistoryPage(),
        },
      ),
    );
  }
}
