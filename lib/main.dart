import 'package:app_flashcards/pages/home/home.page.dart';
import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

void main() async {
  GetIt.I.registerSingleton<HomeStore>(HomeStore());
  await Hive.initFlutter();
  await Hive.openBox('decks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App FlashCards',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
