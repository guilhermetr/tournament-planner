import 'package:tournament_planner/domain/models/tournament.dart';
import 'package:tournament_planner/domain/models/user.dart';
import 'package:tournament_planner/repositories/interfaces/i_tournament_repository.dart';

class TournamentService {
  final ITournamentRepository tournamentRepository;

  TournamentService({required this.tournamentRepository});

  List<Tournament> getTournaments() {
    return tournamentRepository.getTournaments();
  }
}
