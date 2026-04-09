import 'package:flutter/material.dart';

class Deck {
  final String _title;
  String get title => _title;

  final List<Card> cardList;

  Deck({required String title, required this.cardList}) : _title = title;
}
