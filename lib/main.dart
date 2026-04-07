import 'package:app_flashcards/pages/home/home.page.dart';
import 'package:flutter/material.dart';

void main() {
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
