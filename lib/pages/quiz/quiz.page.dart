import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/pages/quiz/widget/card_quiz.widget.dart';
import 'package:app_flashcards/pages/quiz/widget/end_quiz.widget.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final Deck deck;

  const QuizPage({super.key, required this.deck});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;
  bool _isFinished = false;

  void _answerQuestion(bool correct) {
    if (correct) {
      _score++;
    }

    if (_currentIndex < widget.deck.cardList.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // Fim do quiz
      setState(() {
        _isFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardList = widget.deck.cardList;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Quiz: ${widget.deck.title}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: _isFinished
          ? EndQuizz(score: _score)
          : cardList.isEmpty
              ? const Center(child: Text("Nenhum card neste deck."))
              : CardQuiz(
                  deckCard: cardList[_currentIndex],
                  progressText: "${_currentIndex + 1}/${cardList.length}",
                  onCorrect: () => _answerQuestion(true),
                  onWrong: () => _answerQuestion(false),
                ),
    );
  }
}
