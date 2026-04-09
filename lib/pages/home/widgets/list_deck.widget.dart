import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListDeck extends StatelessWidget {
  final HomeStore homeStore;

  const ListDeck({super.key, required this.homeStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: homeStore.deck.length,
                  itemBuilder: (context, index) {
                    final deckItem = homeStore.deck[index];
                    return Card(child: Text(deckItem.title));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
