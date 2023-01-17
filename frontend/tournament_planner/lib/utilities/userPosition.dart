import 'package:tournament_planner/domain/models/user.dart';

class UserPosition {
  UserPosition({
    required this.user,
    required this.position,
    required this.points,
  });

  final User user;
  final int position;
  final int points;
}
