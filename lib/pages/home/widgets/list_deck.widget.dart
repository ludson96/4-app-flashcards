import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/pages/card/card.page.dart';
import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListDeck extends StatelessWidget {
  final HomeStore homeStore;

  const ListDeck({super.key, required this.homeStore});

  void confirmRemoveDeck(BuildContext context, Deck deckItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Excluir deck"),
          content: Text(
            "Tem certeza que deseja excluir o deck '${deckItem.title}'?",
          ),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.black),
              ),
            ),
            FilledButton(
              onPressed: () {
                homeStore.removeDeck(id: deckItem.id);
                Navigator.of(context).pop();
              },
              style: FilledButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                "Excluir",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

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
                  itemCount: homeStore.decks.length,
                  itemBuilder: (context, index) {
                    final deckItem = homeStore.decks[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardPage(deck: deckItem),
                          ),
                        );
                      },
                      onLongPress: () {
                        confirmRemoveDeck(context, deckItem);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              deckItem.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text("${deckItem.cardList.length} cartões"),
                          ],
                        ),
                      ),
                    );
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
