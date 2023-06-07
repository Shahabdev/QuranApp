import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quranproject/reprository/Surah_repository.dart';
import 'package:quranproject/reprository/juzs_repository.dart';
import 'package:quranproject/utils/routes/routes_name.dart';
import 'package:quranproject/utils/routes/routes_switching.dart';
import 'package:quranproject/view/splash_screen.dart';
import 'package:quranproject/view_model/JuzViewModal.dart';
import 'package:quranproject/view_model/surahName_viewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JuzViewModal>(create: (context) {
          return JuzViewModal();
        },),
        ChangeNotifierProvider<SurahNameViewModal>(create: (context) {
          return SurahNameViewModal();
        },),
        ChangeNotifierProvider(create: (context) {
          return simplePorvider();
        },),
      ],

      child: const MaterialApp(
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute:Routes.generateRoutes,
        ),
    );
  }
}

