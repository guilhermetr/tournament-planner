import 'package:tournament_planner/domain/models/game.dart';
import 'package:tournament_planner/utilities/enums.dart';
import 'package:tournament_planner/utilities/userPosition.dart';

class Tournament {
  Tournament({
    required this.id,
    required this.name,
    required this.games,
    required this.userPositions,
    this.gamePoints,
  });

  final int id;
  final String name;
  final List<Game> games;
  final List<UserPosition> userPositions;
  final Map<Position, int>? gamePoints;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }

  Tournament fromJson(dynamic jsonData) {
    return Tournament(
      id: jsonData["id"],
      name: jsonData["name"],
      games: games,
      userPositions: userPositions,
    );
  }
}
