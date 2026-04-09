import 'package:flutter/material.dart';

class Deck {
  final String _title;
  final get title;
  String get title => _title;

  final List<Card> cardList;

  Deck({required this.title, required this.cardList});
  Deck({required String title, required this.cardList}) : _title = title;
}
