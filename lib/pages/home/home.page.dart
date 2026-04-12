import 'package:app_flashcards/pages/home/widgets/add_deck.widget.dart';
import 'package:app_flashcards/pages/home/widgets/deck_empty.widget.dart';
import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:app_flashcards/pages/home/widgets/list_deck.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:app_flashcards/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeStore = getIt<HomeStore>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Decks",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            if (homeStore.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return homeStore.decks.isEmpty
                ? DeckEmpty(homeStore: homeStore)
                : ListDeck(homeStore: homeStore);
          },
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        child: FloatingActionButton.extended(
          extendedPadding: EdgeInsets.only(right: 20, left: 20),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddDeck(homeStore: homeStore)),
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
