import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tournament_planner/domain/models/game.dart';
import 'package:tournament_planner/domain/models/tournament.dart';
import 'package:tournament_planner/presentation/screens/game_info.dart';
import 'package:tournament_planner/presentation/widgets/card_button.dart';
import 'package:tournament_planner/utilities/enums.dart';

class TournamentInfo extends StatelessWidget {
  const TournamentInfo({
    super.key,
    required this.tournament,
  });

  final Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        appBar: AppBar(
          title: Text(tournament.name),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Pruebas'),
              Tab(text: 'Clasificación'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: TournamentGames(games: tournament.games),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TournamentRanking(tournament: tournament),
            ),
          ],
        ),
      ),
    );
  }
}

class TournamentGames extends StatelessWidget {
  const TournamentGames({
    super.key,
    required this.games,
  });

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: games
          .map(
            (game) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CardButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameInfo(game: game),
                    ),
                  );
                },
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          game.name,
                          style: const TextStyle(
                            color: Color.fromRGBO(50, 50, 50, 1),
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          DateFormat.Hm().format(game.startTime),
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                    Text(
                      'Ganador: ${game.userRanking?[Position.firstPlace] ?? '-'}',
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class TournamentRanking extends StatefulWidget {
  const TournamentRanking({
    super.key,
    required this.tournament,
  });

  final Tournament tournament;

  @override
  State<TournamentRanking> createState() => _TournamentRankingState();
}

class _TournamentRankingState extends State<TournamentRanking> {
  @override
  Widget build(BuildContext context) {
    final userPositions = widget.tournament.userPositions;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Posición'), Text('Puntos')],
            ),
          ),
          Wrap(
            runSpacing: 10,
            children: (userPositions
                  ..sort((e1, e2) => e1.position.compareTo(e2.position)))
                .map(
                  (userPosition) => CardButton(
                    onPressed: () {},
                    borderColor: getCardBorderColor(userPosition.position),
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${userPosition.position}. ',
                              style: const TextStyle(
                                color: Color.fromRGBO(80, 80, 80, 1),
                              ),
                            ),
                            Text(
                              userPosition.user.username,
                              style: const TextStyle(
                                color: Color.fromRGBO(50, 50, 50, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${userPosition.points}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Color? getCardBorderColor(int position) {
    if (position == 1) return const Color.fromRGBO(255, 223, 0, 1);
    if (position == 2) return const Color.fromRGBO(180, 180, 180, 1);
    if (position == 3) return const Color.fromRGBO(205, 127, 50, 0.8);
    return null;
  }
}
