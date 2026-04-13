// lib/services/add_card_to_deck.service.dart
import 'package:app_flashcards/adapters/deck_hive.adapter.dart';
import 'package:app_flashcards/models/card.model.dart';
import 'package:app_flashcards/models/deck.model.dart';

/// Serviço responsável por adicionar um novo cartão a um deck existente.
class AddCardToDeckService {
  final IDeckHiveAdapter _deckAdapter;

  AddCardToDeckService(this._deckAdapter);

  /// Adiciona um novo cartão com [question] e [answer] ao deck com [deckId].
  Future<Deck> call({
    required String deckId,
    required String question,
    required String answer,
  }) async {
    // 1. Busca o deck existente pelo ID.
    final deck = await _deckAdapter.getById(deckId);
    if (deck == null) {
      throw Exception('Deck com id $deckId não encontrado');
    }

    // 2. Cria o novo cartão.
    final newCard = Card(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      question: question,
      answer: answer,
    );

    // 3. Cria uma nova lista de cartões, mantendo a imutabilidade.
    final updatedCardList = List<Card>.from(deck.cardList)..add(newCard);

    // 4. Cria uma cópia atualizada do deck.
    final updatedDeck = deck.copyWith(cardList: updatedCardList);

    // 5. Salva o deck atualizado no Hive (sobrescrevendo o antigo).
    await _deckAdapter.save(updatedDeck);

    return updatedDeck;
  }
}
