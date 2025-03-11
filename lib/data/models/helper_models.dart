sealed class SelectionModel {
  factory SelectionModel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('home') &&
        json.containsKey('draw') &&
        json.containsKey('away')) {
      return HUBModel.fromJson(json);
    } else if (json.containsKey('true') && json.containsKey('false')) {
      return BoolModel.fromJson(json);
    } else {
      throw ArgumentError('Invalid SelectionModel JSON: $json');
    }
  }

  Map<String, dynamic> toJson();
}

class BoolModel implements SelectionModel {
  final double trueOdds;
  final double falseOdds;

  BoolModel({required this.trueOdds, required this.falseOdds});

  factory BoolModel.fromJson(Map<String, dynamic> json) {
    return BoolModel(
      trueOdds: json['true'].toDouble(),
      falseOdds: json['false'].toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'true': trueOdds, 'false': falseOdds};
  }
}

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

class HUBModel implements SelectionModel {
  final double home;
  final double draw;
  final double away;

  HUBModel({required this.home, required this.draw, required this.away});

  factory HUBModel.fromJson(Map<String, dynamic> json) {
    return HUBModel(
      home: json['home'].toDouble(),
      draw: json['draw'].toDouble(),
      away: json['away'].toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'home': home, 'draw': draw, 'away': away};
  }
}
