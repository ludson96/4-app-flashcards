import 'package:flutter/material.dart';

class AddDeck extends StatelessWidget {
  final titleDeckController = TextEditingController();

  AddDeck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo deck"), centerTitle: true),
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
              onPressed: () {},
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
