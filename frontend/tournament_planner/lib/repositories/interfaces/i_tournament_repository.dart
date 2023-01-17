import 'package:tournament_planner/domain/models/tournament.dart';

abstract class ITournamentRepository {
  List<Tournament> getTournaments();
}
