import 'package:flutter/material.dart';

class EndQuizz extends StatelessWidget {
  const EndQuizz({super.key, required int score}) : _score = score;

  final int _score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'O quiz acabou.\nVocê fez $_score ponto(s)',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 38, fontWeight: .w500),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Voltar',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
