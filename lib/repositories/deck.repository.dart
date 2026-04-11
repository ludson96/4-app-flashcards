import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/services/create_deck.service.dart';
import 'package:app_flashcards/services/get_deck.service.dart';
import 'package:app_flashcards/services/remove_deck.service.dart';

class DeckRepository {
  final GetDeckService _getDeckService;
  final CreateDeckService _createDeckService;
  final RemoveDeckService _removeDeckService;

  DeckRepository({
    required GetDeckService getDecks,
    required CreateDeckService createDeck,
    required RemoveDeckService removeDeck,
  }) : _getDeckService = getDecks,
       _createDeckService = createDeck,
       _removeDeckService = removeDeck;

  /// Retorna todas os decks salvos.
  Future<List<Deck>> getDecks() => _getDeckService();

  /// Cria um novo deck com o [title] informado.
  Future<Deck> createDeck(String title) => _createDeckService(title);

  /// Remove um Deck pelo [id] informado.
  Future<void> removeDeck(String id) => _removeDeckService(id);
}
