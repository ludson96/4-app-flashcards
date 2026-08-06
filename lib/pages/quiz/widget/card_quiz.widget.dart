import 'package:app_flashcards/models/deck_card.model.dart';
import 'package:flutter/material.dart';

class CardQuiz extends StatefulWidget {
  final DeckCard deckCard;
  final String progressText;
  final VoidCallback onCorrect;
  final VoidCallback onWrong;

  const CardQuiz({
    super.key,
    required this.deckCard,
    required this.progressText,
    required this.onCorrect,
    required this.onWrong,
  });

  @override
  State<CardQuiz> createState() => _CardQuizState();
}

class _CardQuizState extends State<CardQuiz> {
  bool _showAnswer = false;

  @override
  void didUpdateWidget(covariant CardQuiz oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reseta a visualização da resposta ao mudar de card
    if (oldWidget.deckCard.id != widget.deckCard.id) {
      _showAnswer = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(widget.progressText, style: const TextStyle(fontSize: 28)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          widget.deckCard.question,
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (_showAnswer) ...[
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            widget.deckCard.answer,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                      const SizedBox(height: 20),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _showAnswer = !_showAnswer;
                          });
                        },
                        icon: Icon(
                          _showAnswer
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                        ),
                        label: Text(
                          _showAnswer
                              ? "Esconder resposta"
                              : "Visualizar resposta",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.55,
                    child: Column(
                      children: [
                        FilledButton(
                          key: Key("btnAcertei"),
                          onPressed: widget.onCorrect,
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: const Text(
                            "Acertei :)",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FilledButton(
                          key: Key("btnErrei"),
                          onPressed: widget.onWrong,
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          child: const Text(
                            "Errei :(",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
