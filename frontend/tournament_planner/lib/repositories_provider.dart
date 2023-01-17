import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tournament_planner/repositories/game_repository.dart';
import 'package:tournament_planner/repositories/tournament_repository.dart';
import 'package:tournament_planner/repositories/user_repository.dart';

class RepositoriesProvider {
  static MultiRepositoryProvider multiRepositoryProvider({
    required Widget child,
    required BuildContext context,
  }) =>
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) => GameRepository(),
          ),
          RepositoryProvider(
            create: (context) => TournamentRepository(),
          ),
        ],
        child: child,
      );
}
