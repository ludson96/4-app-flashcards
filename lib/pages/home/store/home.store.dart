import 'package:app_flashcards/models/deck.model.dart';
import 'package:app_flashcards/repositories/deck.repository.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final DeckRepository _repository;

  _HomeStore(this._repository);

  @observable
  ObservableList<Deck> _decks = ObservableList<Deck>();
  ObservableList<Deck> get decks => _decks;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @action
  Future<void> loadAllDecks() async {
    _isLoading = true;
    try {
      final result = await _repository.getDecks();
      _decks.clear();
      _decks.addAll(result);
    } catch (e) {
      /* Em caso de falha, mantém a lista atual */
    } finally {
      _isLoading = false;
    }
  }

  @action
  Future<void> createDeck({required String title}) async {
    await _repository.createDeck(title.trim());
    await loadAllDecks();
  }

  @action
  Future<void> removeDeck({required String id}) async {
    await _repository.removeDeck(id);
    await loadAllDecks();
  }

  @action
  Future<void> addCardToDeck({
    required String deckId,
    required String question,
    required String answer,
  }) async {
    try {
      // Chama o repositório para salvar o card e obter o deck atualizado
      final updatedDeck = await _repository.addCardToDeck(
        deckId: deckId,
        question: question,
        answer: answer,
      );

      // Encontra o índice do deck antigo na lista observável
      final index = decks.indexWhere((d) => d.id == updatedDeck.id);

      // Substitui o objeto antigo pelo novo para que o MobX detecte a mudança
      if (index != -1) {
        decks[index] = updatedDeck;
      }
    } catch (e) {
      // TODO: Tratar o erro (ex: mostrar um snackbar)
    }
  }
}
