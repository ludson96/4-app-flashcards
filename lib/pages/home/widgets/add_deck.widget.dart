import 'package:flutter/material.dart';

class AddDeck extends StatelessWidget {
  const AddDeck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Novo deck"), centerTitle: true),
    );
  }
}
