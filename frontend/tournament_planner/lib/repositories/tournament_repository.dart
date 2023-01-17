import 'package:tournament_planner/domain/models/game.dart';
import 'package:tournament_planner/domain/models/tournament.dart';
import 'package:tournament_planner/domain/models/user.dart';
import 'package:tournament_planner/repositories/interfaces/i_tournament_repository.dart';
import 'package:tournament_planner/utilities/enums.dart';
import 'package:tournament_planner/utilities/userPosition.dart';

class TournamentRepository implements ITournamentRepository {
  TournamentRepository();

  @override
  List<Tournament> getTournaments() {
    final games = [
      Game(
        id: 1,
        name: "Ping Pong",
        startTime: DateTime.parse('2023-01-31 08:00:00Z'),
      ),
      Game(
        id: 2,
        name: "Pulseada",
        startTime: DateTime.parse('2023-01-31 09:00:00Z'),
      ),
      Game(
        id: 3,
        name: "Carrera 100m",
        startTime: DateTime.parse('2023-01-31 09:30:00Z'),
      ),
      Game(
        id: 4,
        name: "Flexiones",
        startTime: DateTime.parse('2023-01-31 11:00:00Z'),
      ),
      Game(
        id: 5,
        name: "Dominadas",
        startTime: DateTime.parse('2023-01-31 16:00:00Z'),
      ),
      Game(
        id: 5,
        name: "Carrera 5km",
        startTime: DateTime.parse('2023-01-31 18:00:00Z'),
      ),
      Game(
        id: 5,
        name: "Aesthetic Physique",
        startTime: DateTime.parse('2023-01-31 19:00:00Z'),
      ),
    ];

    final userPositions = [
      UserPosition(
        user: const User(id: 1, username: 'Guilherme'),
        position: 1,
        points: 95,
      ),
      UserPosition(
        user: const User(id: 2, username: 'Gregorio'),
        position: 3,
        points: 4,
      ),
      UserPosition(
        user: const User(id: 3, username: 'Tomás'),
        position: 2,
        points: 5,
      ),
      UserPosition(
        user: const User(id: 4, username: 'Test'),
        position: 4,
        points: 2,
      ),
      UserPosition(
        user: const User(id: 5, username: 'Test2'),
        position: 5,
        points: 1,
      ),
    ];

    return [
      Tournament(
        id: 1,
        name: "Juegos Olímpicos",
        games: games,
        userPositions: userPositions,
        gamePoints: {
          Position.firstPlace: 2,
          Position.secondPlace: 1,
          Position.thirdPlace: 0,
        },
      ),
      Tournament(
        id: 2,
        name: "Torneon",
        games: [],
        userPositions: [],
      ),
    ];
  }
}
