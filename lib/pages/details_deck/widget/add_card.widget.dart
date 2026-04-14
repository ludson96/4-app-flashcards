import 'package:app_flashcards/injection_container.dart';
import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  final Deck deck;

  const AddCard({super.key, required this.deck});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();
  final homeStore = getIt<HomeStore>();

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Novo cartão"), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              spacing: 50,
              children: [
                TextFormField(
                  key: Key("inputPergunta"),
                  controller: _questionController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, insira a pergunta';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Pergunta',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                TextFormField(
                  key: Key("inputResposta"),
                  controller: _answerController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Por favor, insira a resposta';
                    }
                    return null;
                  },
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Resposta',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                OutlinedButton(
                  key: Key("addCardQuestion"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Captura os inputs aqui pois o form foi validado com sucesso!
                      final question = _questionController.text;
                      final answer = _answerController.text;

                      homeStore.addCardToDeck(
                        deckId: widget.deck.id,
                        question: question,
                        answer: answer,
                      );

                      Navigator.pop(context);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
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
        ),
      ),
    );
  }
}
