import 'package:app_flashcards/models/deck_card.model.dart';
import 'package:hive_ce/hive_ce.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 0)
class Deck {
  @HiveField(0)
  String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<DeckCard> cardList;

  Deck({required this.id, required this.title, required this.cardList});

  Deck copyWith({String? id, String? title, List<DeckCard>? cardList}) {
    return Deck(
      id: id ?? this.id,
      title: title ?? this.title,
      cardList: cardList ?? this.cardList,
    );
  }
}
