import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/services/add_card_to_deck.service.dart';
import 'package:app_flashcards/services/create_deck.service.dart';
import 'package:app_flashcards/services/get_deck.service.dart';
import 'package:app_flashcards/services/remove_deck.service.dart';

class DeckRepository {
  final GetDeckService _getDeckService;
  final CreateDeckService _createDeckService;
  final RemoveDeckService _removeDeckService;
  final AddCardToDeckService _addCardToDeckService;

  DeckRepository({
    required GetDeckService getDecks,
    required CreateDeckService createDeck,
    required RemoveDeckService removeDeck,
    required AddCardToDeckService addCardToDeck,
  }) : _getDeckService = getDecks,
       _createDeckService = createDeck,
       _removeDeckService = removeDeck,
       _addCardToDeckService = addCardToDeck;

  /// Retorna todas os decks salvos.
  Future<List<Deck>> getDecks() => _getDeckService();

  /// Cria um novo deck com o [title] informado.
  Future<Deck> createDeck(String title) => _createDeckService(title);

  /// Adiciona um novo cartão a um deck.
  Future<Deck> addCardToDeck({
    required String deckId,
    required String question,
    required String answer,
  }) =>
      _addCardToDeckService(deckId: deckId, question: question, answer: answer);

  /// Remove um Deck pelo [id] informado.
  Future<void> removeDeck(String id) => _removeDeckService(id);
}
