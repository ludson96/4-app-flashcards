import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/pages/details_deck/widget/add_card.widget.dart';
import 'package:flutter/material.dart';

class DetailsDeck extends StatelessWidget {
  final Deck deck;

  const DetailsDeck({super.key, required this.deck});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          deck.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    deck.title,
                    style: TextStyle(fontSize: 50, fontWeight: .w500),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "${deck.cardList.length} cartões",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCard()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: .symmetric(horizontal: 60, vertical: 12),
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  child: Text(
                    "Add Cartão",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    padding: .symmetric(horizontal: 60, vertical: 12),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(3),
                    ),
                  ),
                  child: Text(
                    "Iniciar Quiz",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
