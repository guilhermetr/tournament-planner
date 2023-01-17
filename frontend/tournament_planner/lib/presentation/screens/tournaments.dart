import 'package:flutter/material.dart';
import 'package:tournament_planner/domain/models/tournament.dart';
import 'package:tournament_planner/domain/services/tournament_service.dart';
import 'package:tournament_planner/main.dart';
import 'package:tournament_planner/presentation/screens/tournament_info.dart';

class Tournaments extends StatelessWidget {
  const Tournaments({super.key});

  @override
  Widget build(BuildContext context) {
    final TournamentService tournamentService =
        serviceLocator.get<TournamentService>();
    final List<Tournament> tournaments = tournamentService.getTournaments();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Torneos'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Agregar Torneo',
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Wrap(
          runSpacing: 14,
          children: tournaments
              .map(
                (tournament) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TournamentButton(
                    tournament: tournament,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TournamentInfo(tournament: tournament)),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class TournamentButton extends StatelessWidget {
  const TournamentButton({
    super.key,
    required this.tournament,
    required this.onPressed,
  });

  final Tournament tournament;
  final void Function() onPressed;

  static const height = 50.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: FloatingActionButton(
        heroTag: null,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              tournament.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
