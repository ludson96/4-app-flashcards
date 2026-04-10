import 'package:app_flashcards/adapters/deck_hive.adapter.dart';
import 'package:app_flashcards/models/deck.model.dart';

/// Serviço responsável por criar e salvar um novo deck.
class CreateDeckService {
  final IDeckHiveAdapter _taskAdapter;

  CreateDeckService(this._taskAdapter);

  /// Cria um novo deck com o [title] informado e o salva.
  Future<Deck> call(String title) async {
    final deck = Deck(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      cardList: [],
    );

    await _taskAdapter.save(deck);

    return deck;
  }
}
