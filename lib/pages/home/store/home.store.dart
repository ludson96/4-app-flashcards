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
  Future<void> createDeck(String title) async {
    await _repository.createDeck(title.trim());
    await loadAllDecks(); 
  }
}
