import 'package:app_flashcards/adapters/deck_hive.adapter.dart';

class RemoveDeckService {
  final IDeckHiveAdapter _deckAdapter;

  RemoveDeckService(this._deckAdapter);

  Future<void> call(String id) async {
    return await _deckAdapter.delete(id);
  }
}
