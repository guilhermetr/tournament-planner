import 'package:flutter/material.dart';
import 'package:tournament_planner/domain/models/game.dart';

class GameInfo extends StatelessWidget {
  const GameInfo({
    super.key,
    required this.game,
  });

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
    );
  }
}
