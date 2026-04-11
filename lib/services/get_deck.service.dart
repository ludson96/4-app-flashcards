import 'package:app_flashcards/adapters/deck_hive.adapter.dart';
import 'package:app_flashcards/models/deck.model.dart';

/// Serviço responsável por listar todos os decks e salvar localmente.
class GetDeckService {
  final IDeckHiveAdapter _deckAdapter;

  GetDeckService(this._deckAdapter);

  /// Retorna a lista de todos os decks.
  Future<List<Deck>> call() async {
    return await _deckAdapter.getAll();
  }
}
