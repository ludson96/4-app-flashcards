import 'package:app_flashcards/adapters/deck_hive.adapter.dart';
import 'package:app_flashcards/repositories/deck.repository.dart';
import 'package:app_flashcards/services/create_deck.service.dart';
import 'package:app_flashcards/services/get_deck.service.dart';
import 'package:app_flashcards/services/remove_deck.service.dart';
import 'package:app_flashcards/pages/home/store/home.store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDeckDependencies() async {
  // Inicializa o Hive e abre a caixa de decks
  final deckAdapter = DeckHiveAdapter();
  await deckAdapter.init();
  getIt.registerLazySingleton<IDeckHiveAdapter>(() => deckAdapter);

  // Services
  getIt.registerLazySingleton<GetDeckService>(() => GetDeckService(getIt()));

  getIt.registerLazySingleton<CreateDeckService>(
    () => CreateDeckService(getIt()),
  );

  getIt.registerLazySingleton<RemoveDeckService>(
    () => RemoveDeckService(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<DeckRepository>(
    () => DeckRepository(
      getDecks: getIt(),
      createDeck: getIt(),
      removeDeck: getIt(),
    ),
  );

  // Stores
  getIt.registerLazySingleton<HomeStore>(() => HomeStore(getIt()));
}
