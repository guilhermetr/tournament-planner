import 'package:tournament_planner/utilities/enums.dart';

class Game {
  const Game({
    required this.id,
    required this.name,
    required this.startTime,
    this.userRanking,
  });

  final int id;
  final String name;
  final DateTime startTime;
  final Map<Position, int>? userRanking;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "startTime": startTime,
    };
  }

  Game fromJson(dynamic jsonData) {
    return Game(
      id: jsonData["id"],
      name: jsonData["name"],
      startTime: jsonData["startTime"],
    );
  }
}
