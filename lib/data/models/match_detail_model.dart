import 'package:betmax_app_master/data/models/helper_models.dart';
import 'package:betmax_app_master/data/models/market_model.dart';

class MatchDetailModel {
  final String ntId;
  final String homeTeam;
  final String awayTeam;
  final DateTime startTime;
  final String tournament;
  final List<MarketModel> markets;
  final EloModel elo;

  MatchDetailModel({
    required this.startTime,
    required this.tournament,
    required this.ntId,
    required this.homeTeam,
    required this.awayTeam,
    required this.markets,
    required this.elo,
  });

  factory MatchDetailModel.fromJson(Map<String, dynamic> json) {
    return MatchDetailModel(
      ntId: json['NT_id'],
      homeTeam: json['home_team'],
      awayTeam: json['away_team'],
      startTime: DateTime.parse(json['start_time']),
      tournament: json['tournament'],
      markets: (json['markets'] as List)
          .map((market) => MarketModel.fromJson(market))
          .toList(),
      elo: EloModel.fromJson(json['elo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'NT_id': ntId,
      'home_team': homeTeam,
      'away_team': awayTeam,
      'start_time': startTime.toIso8601String(),
      'tournament': tournament,
      'markets': markets.map((market) => market.toJson()).toList(),
      'elo': elo.toJson(),
    };
  }
}
