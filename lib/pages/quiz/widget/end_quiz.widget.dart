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
            const SizedBox(height: 30),
            FilledButton.icon(
              key: const Key("btnVoltar"),
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, size: 20),
              label: const Text(
                'Voltar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
