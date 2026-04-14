import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';

class AddDeckPage extends StatefulWidget {
  final HomeStore homeStore;

  const AddDeckPage({super.key, required this.homeStore});

  @override
  State<AddDeckPage> createState() => _AddDeckPageState();
}

class _AddDeckPageState extends State<AddDeckPage> {
  final titleDeckController = TextEditingController();

  @override
  void dispose() {
    titleDeckController.dispose();
    super.dispose();
  }

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
              key: Key("tituloDeck"),
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
              key: Key("btnAdicionarDeck"),
              onPressed: () {
                widget.homeStore.createDeck(title: titleDeckController.text);
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
