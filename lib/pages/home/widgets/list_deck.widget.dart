import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';

class ListDeck extends StatelessWidget {
  final HomeStore homeStore;

  const ListDeck({super.key, required this.homeStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ListView.builder(
            itemCount: homeStore.deck.length,
            itemBuilder: (context, index) {
              return Card(child: Text(homeStore.deck.name));
            },
          ),
        ],
      ),
    );
  }
}
