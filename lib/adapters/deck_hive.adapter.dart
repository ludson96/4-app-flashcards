import 'package:app_flashcards/models/deck.model.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

abstract interface class IDeckHiveAdapter {
  /// Inicializa o Hive e registra os adapters necessários.
  Future<void> init();

  /// Retorna todos os decks salvas.
  Future<List<Deck>> getAll();

  /// Salva um novo [deck].
  Future<void> save(Deck deck);

  /// Remove um deck pelo [id].
  Future<void> delete(String id);

  /// Limpa todos os dados da caixa de decks.
  Future<void> clear();
}

class DeckHiveAdapter implements IDeckHiveAdapter {
  static const String _boxName = 'decks';
  late Box<Deck> _box;

  @override
  Future<void> init() async {
    // Inicializa o Hive com o diretório de documentos do app
    final appDocsDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocsDir.path);

    // Registra o adapter do modelo Desk (typeId 0)
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DeckAdapter());
    }

    // Abre a caixa de decks
    if (!Hive.isBoxOpen(_boxName)) {
      _box = await Hive.openBox<Deck>(_boxName);
    } else {
      _box = Hive.box<Deck>(_boxName);
    }
  }

  @override
  Future<List<Deck>> getAll() async {
    return _box.values.toList();
  }

  @override
  Future<void> save(Deck deck) async {
    await _box.put(deck.id, deck);
  }

  @override
  Future<void> delete(String id) async {
    await _box.delete(id);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}
