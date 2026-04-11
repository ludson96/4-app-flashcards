import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/services/create_deck.service.dart';
import 'package:app_flashcards/services/get_deck.service.dart';

class DeckRepository {
  final GetDeckService _getDeckService;
  final CreateDeckService _createDeckService;

  DeckRepository({
    required GetDeckService getDecks,
    required CreateDeckService createDeck,
  }) : _getDeckService = getDecks,
       _createDeckService = createDeck;

  /// Retorna todas os decks salvos.
  Future<List<Deck>> getDecks() => _getDeckService();

  /// Cria um novo deck com o [title] informado.
  Future<Deck> createDeck(String title) => _createDeckService(title);
}
