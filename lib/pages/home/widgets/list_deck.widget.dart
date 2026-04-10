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
                    return InkWell(
                      onTap: () {
                        // Coloque aqui a ação de navegação ou o que desejar fazer ao clicar
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
