import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tournament_planner/domain/services/tournament_service.dart';
import 'package:tournament_planner/presentation/screens/tournaments.dart';
import 'package:tournament_planner/repositories/tournament_repository.dart';

final serviceLocator = GetIt.instance;
void setUp() {
  serviceLocator.registerSingleton(TournamentRepository());
  serviceLocator.registerSingleton(TournamentService(
    tournamentRepository: serviceLocator.get<TournamentRepository>(),
  ));
}

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tournament Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Tournaments(),
    );
  }
}
