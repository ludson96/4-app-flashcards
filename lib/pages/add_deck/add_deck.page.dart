import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';

class AddDeckPage extends StatelessWidget {
  final titleDeckController = TextEditingController();
  final HomeStore homeStore;

  AddDeckPage({super.key, required this.homeStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Novo deck"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          spacing: 40,
          mainAxisAlignment: .center,
          children: [
            Text(
              "Qual é o título do seu novo deck?",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: .w500),
            ),
            TextFormField(
              controller: titleDeckController,
              decoration: const InputDecoration(
                labelText: 'Título do deck',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                homeStore.createDeck(title: titleDeckController.text);
                Navigator.of(context).pop();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: const Text(
                "Adicionar",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
