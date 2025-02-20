import 'package:betmax_app_master/data/models/elo_model.dart';
import 'package:betmax_app_master/data/models/hub_model.dart';

class MatchModel {
  final String ntId;
  final String homeTeam;
  final String awayTeam;
  final DateTime startTime;
  final String tournament;
  final HUBModel odds;
  final EloModel elo;
  final HUBModel oddsDifferences;
  final HUBModel expectedValue;

  MatchModel(
      {required this.startTime,
      required this.tournament,
      required this.ntId,
      required this.homeTeam,
      required this.awayTeam,
      required this.odds,
      required this.elo,
      required this.oddsDifferences,
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
      oddsDifferences: HUBModel.fromJson(json['odds_differences']),
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
      'odds_differences': oddsDifferences.toJson(),
      'expected_value': expectedValue.toJson(),
    };
  }
}
