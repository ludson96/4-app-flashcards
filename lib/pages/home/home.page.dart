import 'package:app_flashcards/pages/home/widgets/add_deck.widget.dart';
import 'package:app_flashcards/pages/home/widgets/deck_empty.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Decks",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(child: DeckEmpty()),
      floatingActionButton: SizedBox(
        height: 50, // Altere este valor para achatar mais ou menos o botão
        child: FloatingActionButton.extended(
          extendedPadding: EdgeInsets.only(right: 20, left: 20),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddDeck()),
            );
          },
          label: Text(
            "Adicionar",
            style: TextStyle(color: Colors.white, letterSpacing: 2),
          ),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
