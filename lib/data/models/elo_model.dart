import 'package:betmax_app_master/data/models/hub_model.dart';

class EloModel {
  final double homeElo;
  final double awayElo;
  final HUBModel eloProbs;

  EloModel(
      {required this.homeElo, required this.awayElo, required this.eloProbs});

  factory EloModel.fromJson(Map<String, dynamic> json) {
    return EloModel(
      homeElo: json['home_elo'].toDouble(),
      awayElo: json['away_elo'].toDouble(),
      eloProbs: HUBModel.fromJson(json['probs']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'home_elo': homeElo,
      'away_elo': awayElo,
      'probs': eloProbs.toJson()
    };
  }
}
