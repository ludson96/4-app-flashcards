import 'package:app_flashcards/models/deck.model.dart';
import 'package:mobx/mobx.dart';

part 'home.store.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  ObservableList<Deck> deck = <Deck>[].asObservable();

  @observable
  bool isLoading = false;

  @action
  void addDeck({required String title}) {
    final newDeck = Deck(title: title, cardList: []);
    deck.add(newDeck);
  }
}
