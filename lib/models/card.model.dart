import 'package:hive_ce/hive_ce.dart';

part 'card.model.g.dart';

@HiveType(typeId: 1)
class Card {
  @HiveField(0)
  final String question;
  
  @HiveField(1)
  final String answer;

  Card({required this.question, required this.answer});
}
