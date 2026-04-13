import 'package:hive_ce/hive_ce.dart';

part 'card.model.g.dart';

@HiveType(typeId: 1)
class Card {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String question;

  @HiveField(2)
  final String answer;

  Card({required this.id, required this.question, required this.answer});
}
