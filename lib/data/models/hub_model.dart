class HUBModel {
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

  Map<String, dynamic> toJson() {
    return {'home': home, 'draw': draw, 'away': away};
  }
}
