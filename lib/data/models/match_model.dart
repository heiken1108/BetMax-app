import 'package:betmax_app_master/data/models/helper_models.dart';

class MatchModel {
  final String ntId;
  final String homeTeam;
  final String awayTeam;
  final DateTime startTime;
  final String tournament;
  final HUBModel odds;
  final EloModel elo;
  final HUBModel expectedValue;

  MatchModel(
      {required this.startTime,
      required this.tournament,
      required this.ntId,
      required this.homeTeam,
      required this.awayTeam,
      required this.odds,
      required this.elo,
      required this.expectedValue});

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      ntId: json['NT_id'],
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
      startTime: DateTime.parse(json['start_time']),
      tournament: json['tournament'],
      odds: HUBModel.fromJson(json['odds']),
      elo: EloModel.fromJson(json['elo']),
      expectedValue: HUBModel.fromJson(json['expected_value']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'NT_id': ntId,
      'home_team': homeTeam,
      'away_team': awayTeam,
      'start_time': startTime.toIso8601String(),
      'tournament': tournament,
      'odds': odds.toJson(),
      'elo': elo.toJson(),
      'expected_value': expectedValue.toJson(),
    };
  }
}
