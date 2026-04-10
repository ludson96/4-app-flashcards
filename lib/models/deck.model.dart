import 'package:app_flashcards/models/card.model.dart';
import 'package:hive_ce/hive_ce.dart';

part 'deck.model.g.dart';

@HiveType(typeId: 0)
class Deck {
  @HiveField(0)
  String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final List<Card> cardList;

  Deck({required this.id, required this.title, required this.cardList});
}
