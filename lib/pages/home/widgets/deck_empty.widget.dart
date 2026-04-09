import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:app_flashcards/pages/home/widgets/add_deck.widget.dart';
import 'package:flutter/material.dart';

class DeckEmpty extends StatelessWidget {
  final HomeStore homeStore;

  const DeckEmpty({super.key, required this.homeStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/no_decks.png", width: 300)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ), // Respiro nas laterais
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    color: const Color.fromARGB(255, 216, 215, 215),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AddDeck(homeStore: homeStore),
                    ),
                  );
                },
                child: Text(
                  "Adicionar deck",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
