// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$_decksAtom = Atom(name: '_HomeStore._decks', context: context);

  @override
  ObservableList<Deck> get _decks {
    _$_decksAtom.reportRead();
    return super._decks;
  }

  @override
  set _decks(ObservableList<Deck> value) {
    _$_decksAtom.reportWrite(value, super._decks, () {
      super._decks = value;
    });
  }

  late final _$_isLoadingAtom = Atom(
    name: '_HomeStore._isLoading',
    context: context,
  );

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$loadAllDecksAsyncAction = AsyncAction(
    '_HomeStore.loadAllDecks',
    context: context,
  );

  @override
  Future<void> loadAllDecks() {
    return _$loadAllDecksAsyncAction.run(() => super.loadAllDecks());
  }

  late final _$createDeckAsyncAction = AsyncAction(
    '_HomeStore.createDeck',
    context: context,
  );

  @override
  Future<void> createDeck({required String title}) {
    return _$createDeckAsyncAction.run(() => super.createDeck(title: title));
  }

  late final _$removeDeckAsyncAction = AsyncAction(
    '_HomeStore.removeDeck',
    context: context,
  );

  @override
  Future<void> removeDeck({required String id}) {
    return _$removeDeckAsyncAction.run(() => super.removeDeck(id: id));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
